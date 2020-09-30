class ApiController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :auto_login

  private

  def auto_login
    if self.current_user.nil?
      email = request.env["HTTP_X_EMAIL"]
      user = User.find_by(:email => email)
      if !user.nil?
        session[:user] = user.id
        self.current_user = user
      end
    end
  end

  def authorize(realm = "Web Password", errormessage = "Couldn't authenticate you")
    # make the current_user object from any auth sources we have
    setup_user_auth

    # handle authenticate pass/fail
    unless current_user
      # no auth, the user does not exist or the password was wrong
      response.headers["WWW-Authenticate"] = "Basic realm=\"#{realm}\""
      render :plain => errormessage, :status => :unauthorized
      return false
    end
  end

  def current_ability
    # Use capabilities from the oauth token if it exists and is a valid access token
    if Authenticator.new(self, [:token]).allow?
      ApiAbility.new(nil).merge(ApiCapability.new(current_token))
    else
      ApiAbility.new(current_user)
    end
  end

  def deny_access(_exception)
    if current_token
      set_locale
      report_error t("oauth.permissions.missing"), :forbidden
    elsif current_user
      head :forbidden
    else
      realm = "Web Password"
      errormessage = "Couldn't authenticate you"
      response.headers["WWW-Authenticate"] = "Basic realm=\"#{realm}\""
      render :plain => errormessage, :status => :unauthorized
    end
  end

  ##
  # sets up the current_user for use by other methods. this is mostly called
  # from the authorize method, but can be called elsewhere if authorisation
  # is optional.
  def setup_user_auth
    # have we identified the user?
    if current_user
      # check if the user has been banned
      user_block = current_user.blocks.active.take
      unless user_block.nil?
        set_locale
        if user_block.zero_hour?
          report_error t("application.setup_user_auth.blocked_zero_hour"), :forbidden
        else
          report_error t("application.setup_user_auth.blocked"), :forbidden
        end
      end

      # if the user hasn't seen the contributor terms then don't
      # allow editing - they have to go to the web site and see
      # (but can decline) the CTs to continue.
      if !current_user.terms_seen && flash[:skip_terms].nil?
        set_locale
        report_error t("application.setup_user_auth.need_to_see_terms"), :forbidden
      end
    end
  end
end

# Configure ActionMailer SMTP settings
unless Rails.env.test? 
  if Settings.key?(:sendgrid_api_key)
    ActionMailer::Base.delivery_method = :sendgrid_actionmailer
    ActionMailer::Base.sendgrid_actionmailer_settings = {
        api_key: Settings.sendgrid_api_key,
        raise_delivery_errors: true
    }
  else 
    ActionMailer::Base.delivery_method = :smtp
    ActionMailer::Base.smtp_settings = {
      :address => Settings.smtp_address || "localhost",
      :port => Settings.smtp_port || 25,
      :user_name => Settings.smtp_username,
      :password => Settings.smtp_password,
      :domain => Settings.smtp_domain || "localhost",
      :enable_starttls_auto => false
    }
  end
end
# Set the host and protocol for all ActionMailer URLs
ActionMailer::Base.default_url_options = {
  :host => Settings.server_url,
  :protocol => Settings.server_protocol
}

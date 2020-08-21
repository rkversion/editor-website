#Dockerfile
#2.5
FROM ubuntu:18.04

RUN apt-get update -qq && apt-get install -y build-essential git logrotate libxml2-dev libpqxx-dev libfcgi-dev libboost-dev libboost-regex-dev libboost-program-options-dev libboost-date-time-dev libboost-filesystem-dev libboost-system-dev libboost-locale-dev libmemcached-dev libcrypto++-dev ruby2.5 libruby2.5 ruby2.5-dev libmagickwand-dev libxml2-dev libxslt1-dev nodejs build-essential git-core phantomjs postgresql-client libsasl2-dev imagemagick libffi-dev libgd-dev libarchive-dev libbz2-dev vim emacs

ENV LISTEN_PORT 3000
EXPOSE 3000

ENV RAILS_ROOT /app

ARG BUILD_ENV=development

ENV SECRET_KEY_BASE dummytokenforbuild

RUN mkdir -p $RAILS_ROOT

WORKDIR $RAILS_ROOT

COPY Gemfile  Gemfile
COPY Gemfile.lock Gemfile.lock

RUN gem install bundler -v=1.17.3 
RUN gem install bundle
RUN gem update --system
RUN bundle update --bundler
RUN bundle install

COPY . .

RUN rm -f config/credentials.yml.enc
RUN EDITOR=touch bundle exec rails credentials:edit

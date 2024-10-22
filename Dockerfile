FROM ruby:3.0.0 as base
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN apt-get update -qq && apt-get install -y build-essential apt-utils libpq-dev nodejs
WORKDIR /usr/src/app
RUN gem install bundler
COPY Gemfile* ./
RUN bundle install
COPY . .
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]

#rails tailwindcss:install
#rails assets:precompile

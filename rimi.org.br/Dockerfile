FROM ruby:3.3

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
WORKDIR /app
COPY . .
RUN bundle install
RUN yarn install --check-files
CMD ["bin/rails", "server", "-b", "0.0.0.0"]

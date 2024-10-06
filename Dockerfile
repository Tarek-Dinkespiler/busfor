FROM ruby:3.3.5
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs default-mysql-client
RUN mkdir /app
WORKDIR /app
COPY . .
RUN bundle install
CMD ["rails", "server"]
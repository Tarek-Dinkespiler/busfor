FROM ruby:3.3.5

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs default-mysql-client

RUN mkdir /app
WORKDIR /app
COPY . .
RUN bundle install

COPY ./bin/docker-entrypoint.sh /usr/bin/docker-entrypoint.sh
RUN chmod +x /usr/bin/docker-entrypoint.sh
ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 8000

# Start app server.
CMD ["bundle", "exec", "rails", "server", "-p", "8000", "-b", "0.0.0.0"]
FROM ruby:2.5.1
MAINTAINER Bryan Alves <bryanalves@gmail.com>

RUN apt-get update \
  && apt-get install -y --no-install-recommends smartmontools \
  && rm -rf /var/lib/apt/lists/*

RUN mkdir /app
WORKDIR /app
COPY Gemfile* /app/
RUN bundle install

COPY . /app

# Start server
EXPOSE 9100
CMD ["bundle", "exec", "ruby", "app.rb"]

FROM ruby:2.6.5

RUN apt-get update && apt-get install -y cmake libssl-dev && gem install bundler -v 2.1.4

WORKDIR /experteese

COPY Gemfile Gemfile.lock ./

RUN bundle install

EXPOSE 3000

ADD . /experteese
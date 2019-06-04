FROM ruby:alpine
LABEL maintainer="Moritz Heiber <hello@heiber.im>"

ARG BUNDLER_VERSION="2.0"

RUN gem install -v "${BUNDLER_VERSION}" bundler

WORKDIR /presentation
ADD . /presentation

RUN bundle install --path vendor/bundle

EXPOSE 8000/tcp

CMD ["bundle","exec","rake","webserver"]

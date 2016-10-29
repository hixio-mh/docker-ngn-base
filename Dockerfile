FROM mhart/alpine-node:7.0.0
MAINTAINER Corey Butler

ENV PATH $PATH:~/npm-global/bin

RUN apk add -U openssl \
  && mkdir ~/npm-global \
  && npm config set prefix '~/npm-global' \
  && npm install -g ngn@0.3.22 ngn-data@latest localenvironment \
  && cd / \
  && npm link ngn \
  && npm link ngn-data \
  && npm link localenvironment

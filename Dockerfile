FROM mhart/alpine-node:4.4.3
MAINTAINER Corey Butler

ENV PATH $PATH:~/npm-global/bin

RUN mkdir ~/npm-global \
  && npm config set prefix '~/npm-global' \
  && npm install -g ngn@0.3.2 \
  && cd / \
  && npm link ngn

VOLUME ["/app"]
WORKDIR /app

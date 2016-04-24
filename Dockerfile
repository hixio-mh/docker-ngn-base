FROM mhart/alpine-node:4.4.3
MAINTAINER Corey Butler

RUN npm install -g ngn@0.3.1 \
  && cd / \
  && npm link ngn

VOLUME ["/app"]
WORKDIR /app

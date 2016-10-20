FROM mhart/alpine-node:6.9.1
MAINTAINER Corey Butler

ENV PATH $PATH:~/npm-global/bin

RUN mkdir ~/npm-global \
  && npm config set prefix '~/npm-global' \
  && npm install -g ngn@0.3.22 ngn-data@latest \
  && cd / \
  && npm link ngn \
  && npm link ngn-data

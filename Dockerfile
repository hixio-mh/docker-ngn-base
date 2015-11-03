FROM mhart/alpine-node:4.2
MAINTAINER Corey Butler

VOLUME ["/app"]
WORKDIR /app

# Add Dependencies
RUN apk add --update openssl pkgconfig python gcc g++ make \
    && npm install -g ngn \
    && cd / \
    && npm link ngn \
    && apk del pkgconfig python gcc g++ make
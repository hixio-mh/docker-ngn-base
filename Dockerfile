FROM mhart/alpine-node:4.2
MAINTAINER Corey Butler

VOLUME ["/app"]
WORKDIR /app

# Add Dependencies
RUN apk add --update openssl pkgconfig python gcc g++ make \
    && mkdir -p /node_modules \
    && cd /node_modules \
    && npm install ngn \
    && cd /app \
    && apk del pkgconfig python gcc g++ make
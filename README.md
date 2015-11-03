# NGN Base Image

This image is designed specifically for building NGN services. It is designed to be as small as possible, yet serve the most fundamental needs of a microservice architecture. 

## Image Contents: 

 - Alpine Linux (latest)
 - OpenSSL (latest)
 - Node.js (4.2.1) & npm
 - Preinstalled NGN

OpenSSL has the largest physical footprint of this image. The image isn't
"tiny", but it's as small as it can be while still providing security
features.

## Usage

There are a few use cases where this image is very helpful:

### Production Use

To build your own production image, the `Dockerfile` might look like:

```sh
FROM ngnjs/base
MAINTAINER Your Name

ADD ./path/to/app /app

# Add Dependencies
RUN cd /app \
    && npm install

CMD ["npm", "start"]
```

This assumes `npm start` will launch your application (the recommended approach). 
To build this image, execute

```sh
docker build -t MyMicroserviceName .
```

Once built, the service can be run using

```sh
docker run --rm --name MyNgnApp MyMicroserviceName
```

**Alternatively**, if you'd like more control, you can replace the `CMD`
in the Dockerfile with the following:

```sh
CMD ["node"]
```

Once built, this allows you to pass arguments to the container, such as:

```sh
docker run --rm --nam MyNgnApp MyMicroserviceName script.js
```

This is effectively the same thing as running `node script.js`.

### Development

Development is often easier when you have access to the command line and
local file system of your development computer. To do this, bash should be 
added to your Dockerfile.

```sh
FROM ngnjs/base
MAINTAINER Your Name

ADD ./path/to/app /app

# Add Dependencies
RUN apk --update bash

CMD ["/bin/bash"]
```

To build this image, execute

```sh
docker build -t MyMicroserviceName .
```

To run this image, execute

```
docker run -rm -i -t --name MyApp -v /path/to/code:/app MyMicroserviceName
```

This will launch a bash shell in your application directory. You can then
run `npm start`, `node index.js`, or whatever else you like. The container
is mapped to your local system, so you can edit code in your favorite editor
and test it the same way you would in a normal terminal window.

**========== NOTICE ==========**

You'll most likely need to expose ports to test your application. For example,
if you're running a web server on port `80`, then you should run the container
with the ammended command:

```
docker run -rm -i -t --name MyApp -v /path/to/code:/app -p 80:80 MyMicroserviceName
```

The `-p 80:80` maps your computer's port 80 to the container's port 80 where
the node web server is running. Docker also defines an IP address for itself,
so your web server will be available via that IP address on port 80.
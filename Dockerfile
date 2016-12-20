FROM mhart/alpine-node:6
MAINTAINER Sven Fischer <sven@leiderfischer.de>

WORKDIR /src

RUN apk update && apk add --no-cache git openssh-client \
  && git clone https://github.com/krishnasrinivas/wetty /src \
  && apk add --no-cache python make g++ \
  && npm install \
  && apk del -r python make g++ \
  && adduser -h /src -D term

ADD run.sh /src

# Default ENV params used by wetty
ENV REMOTE_SSH_SERVER 127.0.0.1
ENV REMOTE_SSH_PORT 22
ENV REMOTE_SSH_USER root

EXPOSE 3000

ENTRYPOINT "./run.sh"
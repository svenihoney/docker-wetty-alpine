FROM mhart/alpine-node:6
MAINTAINER Sven Fischer <sven@leiderfischer.de>

WORKDIR /src

RUN apk update && apk add --no-cache git  \
  && git clone https://github.com/krishnasrinivas/wetty /src \
  && apk add --no-cache python make g++ \
  && npm install \
  && apk del -r python make g++

EXPOSE 3000

CMD ["node", "app.js", "-p", "3000"]
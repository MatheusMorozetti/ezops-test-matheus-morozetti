FROM node:alpine as builder

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY package*.json ./

RUN npm set strict-ssl false

RUN npm install

COPY ./src .
RUN node ./server.js


EXPOSE 3001

CMD [ "node", "server.js"]
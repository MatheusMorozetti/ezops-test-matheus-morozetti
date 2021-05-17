FROM node:alpine as builder

WORKDIR '/src'

COPY package*.json ./
RUN npm set strict-ssl false
RUN npm install


COPY . .
RUN npx nodemon /ezops-test-matheus-morozetti/src/server.js

EXPOSE 80

FROM node:alpine as builder
WORKDIR '/usr/src/app'
COPY package*.json ./
RUN npm set strict-ssl false
RUN npm install
COPY ./src .
RUN node ./server.js

FROM nginx
EXPOSE 80
COPY --from=builder /src /usr/share/nginx/html
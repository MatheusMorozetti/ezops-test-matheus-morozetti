FROM node:alpine as builder

WORKDIR '/src'

COPY package*.json ./
RUN npm set strict-ssl false
RUN npm install


COPY . ..
RUN node ./server.js

FROM nginx
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html

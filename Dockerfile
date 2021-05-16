FROM node:alpine as builder

WORKDIR '/src'

COPY package*.json ./
RUN npm set strict-ssl false
RUN npm install


COPY . ..
RUN node ./server.js

EXPOSE 8080

CMD ["node", "server.js"]

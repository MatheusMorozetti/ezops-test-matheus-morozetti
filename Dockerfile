FROM node:alpine

WORKDIR '/src'

COPY package*.json ./
RUN npm set strict-ssl false
RUN npm install


COPY . .
RUN npm install -g pm2 
RUN pm2 start src/server.js



EXPOSE 80

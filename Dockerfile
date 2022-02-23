FROM node:16

WORKDIR /usr/src/app

COPY ./app/package*.json ./

RUN npm install

# Bundle app source
COPY ./app .

EXPOSE 8080
CMD [ "node", "server.js" ]

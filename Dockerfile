FROM node:latest
RUN mkdir -p /app
WORKDIR /app
COPY ./sample-apps/package*.json /app/
RUN npm install 
COPY ./sample-apps /app/
EXPOSE 4200
CMD ["npm", "run", "start"]

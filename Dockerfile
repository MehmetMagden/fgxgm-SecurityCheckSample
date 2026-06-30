FROM node:20-alpine

# Alpine paket yöneticisi (apk) kullanarak sistemi güncel tutalım
RUN apk update && apk upgrade && \
    apk add --no-cache sqlite-dev sqlite-libs

RUN npm install -g npm@9.1.3

WORKDIR /app
COPY package*.json ./
RUN npm install

COPY . .

EXPOSE 8080
CMD ["node", "index.js"]

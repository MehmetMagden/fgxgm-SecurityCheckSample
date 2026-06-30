FROM node:18

RUN apt-get update && \
    apt-get install -y --no-install-recommends sqlite3 libsqlite3-0 libsqlite3-dev && \
    rm -rf /var/lib/apt/lists/*
    
RUN apt-get update && apt-get upgrade -y

RUN npm install -g npm@9.1.3

ADD package.json .
ADD index.js .
ADD build .
COPY . .
RUN npm install

EXPOSE 8080

CMD ["node", "index.js"]

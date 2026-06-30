FROM node:18

# Tüm sistem paketlerini güncelleyip temizlik yapıyoruz
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y --no-install-recommends sqlite3 libsqlite3-0 libsqlite3-dev && \
    rm -rf /var/lib/apt/lists/*

RUN npm install -g npm@9.1.3

# Cache (Önbellek) dostu katman yapısı
WORKDIR /app
COPY package*.json ./
RUN npm install

# Geri kalan proje dosyalarını kopyalıyoruz
COPY . .

EXPOSE 8080

CMD ["node", "index.js"]

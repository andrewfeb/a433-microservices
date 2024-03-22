# Menggunakan node:18-alpine sebagai base image
FROM node:18-alpine

# Menentukan working directory untuk container
WORKDIR /app

# Copy package.json dan package-lock.json ke working directory
COPY package*.json ./

# Install semua dependency
RUN npm install

# Download shell script wait-for-it.sh
RUN wget -O /bin/wait-for-it.sh https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh

# Mengubah hak akses wait-for-it.sh agar bisa dieksekusi
RUN chmod +x /bin/wait-for-it.sh

# Copy semua file ke working directory
COPY . .

# Ekspos port yang digunakan oleh aplikasi
EXPOSE 3001

# Menjalankan aplikasi ketika container diluncurkan dan setelah menunggu RabbitMQ berjalan
CMD ["sh", "-c", "./bin/wait-for-it.sh rabbitmq:5672 --timeout=30 -- node index.js"]
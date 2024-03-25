# Menggunakan node:14 sebagai base image
FROM node:14

# Menentukan working directory untuk container
WORKDIR /app

# Copy package.json dan package-lock.json ke working directory
COPY package*.json ./

# Install semua dependency
RUN npm install

# Download shell script wait-for-it.sh
RUN wget -O ./wait-for-it.sh https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh

# Mengubah hak akses wait-for-it.sh agar bisa dieksekusi
RUN chmod +x ./wait-for-it.sh

# Copy semua file ke working directory
COPY . .

# Ekspos port yang digunakan oleh aplikasi
EXPOSE 3000

# Menjalankan perintah node index.js
CMD ["node", "index.js"]
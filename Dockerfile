# Menggunakan base image Node.js versi 14
FROM node:14

# Menentukan working directory untuk container
WORKDIR /app

# Copy semua file ke working directory (/app)
COPY . .

# Menentukan agar aplikasi berjalan dalam production mode dan menggunakan container bernama item-db sebagai database host
ENV NODE_ENV=production DB_HOST=item-db

# Install semua dependency untuk production kemudian build aplikasi
RUN npm install --production --unsafe-perm && npm run build

# Ekspos port yang digunakan oleh aplikasi
EXPOSE 8080

# Ketika container diluncurkan, jalankan server
CMD ["npm", "start"]
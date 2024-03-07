# Membuat docker image dari Dockerfile
docker build -t item-app:v1 .

# Melihat daftar image
docker images

# Mengubah nama image agar sesuai dengan GitHub Packages
docker tag item-app:v1 ghcr.io/andrewfeb/item-app:v1

# Login ke GitHub Packages 
echo $CR_TOKEN | docker login ghcr.io -u andrewfeb --password-stdin

# Push docker image ke GitHub Packages
docker push ghcr.io/andrewfeb/item-app:v1
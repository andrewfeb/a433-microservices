# Membuat docker image dari Dockerfile
docker build -t ghcr.io/andrewfeb/karsajobs:latest .

# Login ke GitHub Packages 
echo $CR_TOKEN | docker login ghcr.io -u andrewfeb --password-stdin

# Push docker image ke GitHub Packages
docker push ghcr.io/andrewfeb/karsajobs:latest
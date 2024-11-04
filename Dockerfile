# Menggunakan Ubuntu sebagai base image
FROM ubuntu:latest

# Memperbarui paket dan menginstall Apache2
RUN apt update && apt install -y
    # apache2 \
    # curl \
    # nano \
    # net-tools \
    # iputils-ping \
    # telnet

# Install PHP dan ekstensi yang diperlukan
RUN apt install -y php \
    # libapache2-mod-php \
    # php-mysql \
    # php-pgsql \
    # php-pdo-pgsql \
    # php-curl \
    # php-gd \
    # php-mbstring \
    # php-xml \
    # php-intl \
    # php-json

# Membuat directory baru
RUN mkdir /home/app

# Pindah ke directory baru
RUN cd /home/app

# Set working directory
WORKDIR /home/app

# Menambahakn Port Publish
EXPOSE 8000

# Menjalankan php server ketika container di-start
CMD ["php", "-S", "0.0.0.0:8000", "-t", "."]


## PETUNJUK DOCKERISE DEPENDCY ##

## to Build this
# docker build -t my_images .

## than Create Container
# docker container create --name my_bootcamp -it -p 8030:8000 -v $(pwd):/home/app my_images

## than running the Container
# docker container start my_bootcamp

## inspection docker server container
# docker exec -it my_bootcamp bash

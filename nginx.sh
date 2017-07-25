#!/bin/bash

# nginx.sh
#
# Gokay Gurcan
# https://www.gokaygurcan.com/
#
# Thanks to Yasin Inat (risyasin) and his hard work:
# https://gist.github.com/risyasin/fc0a6e932ba837c1d20b
# https://gist.github.com/risyasin/2a981bab7586773d849e
# ----------------------------

set -e

# set colors
BLACK=$(tput setaf 0)
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
BLUE=$(tput setaf 4)
MAGENTA=$(tput setaf 5)
CYAN=$(tput setaf 6)
WHITE=$(tput setaf 7)
BOLD=$(tput bold)
RESET=$(tput sgr0)

# global variables
SRC_NGINX=/usr/src/nginx
ARCH=x64

# versions
NGINX_VERSION=${NGINX_VERSION:=1.12.1}
PAGESPEED_VERSION=${PAGESPEED_VERSION:=1.12.34.2}
OPENSSL_VERSION=${OPENSSL_VERSION:=1.1.0f}

# check if architecture is correct
if [ "$(uname -m)" = x86_64 ]; then
  ARCH=x64
else
  ARCH=ia32
fi

# create nginx source directory
if [ ! -d ${SRC_NGINX} ]; then
  echo "$RED ~ Create : $GREEN $SRC_NGINX $RESET"
  mkdir -p ${SRC_NGINX}
fi

echo "$RED ~ Update : $GREEN Packages $RESET"
sudo apt-get update -q
sudo apt-get upgrade -y

echo "$RED ~ Install : $GREEN Packages and libraries $RESET"
sudo apt-get install -y build-essential openssl libssl-dev libssl-doc libgeoip-dev \
  fail2ban aria2 sysstat links libpcre3 libpcre3-dev zlibc zlib1g zlib1g-dbg zlib1g-dev \
  perl libnet-ssleay-perl libauthen-pam-perl libpam-runtime libio-pty-perl \
  apt-show-versions htop iotop iftop xtail unzip git curl python python-setuptools ruby

echo "$RED ~ Download : $GREEN NGINX and its modules $RESET"
# openssl
cd ${SRC_NGINX}
sudo wget https://www.openssl.org/source/openssl-${OPENSSL_VERSION}.tar.gz
sudo tar -xzvf openssl-${OPENSSL_VERSION}.tar.gz

# pagespeed
cd ${SRC_NGINX}
sudo wget https://github.com/pagespeed/ngx_pagespeed/archive/v${PAGESPEED_VERSION}-stable.tar.gz
sudo tar -zxvf v${PAGESPEED_VERSION}-stable.tar.gz

# pagespeed optimization libraries
cd ngx_pagespeed-${PAGESPEED_VERSION}-stable
sudo wget https://dl.google.com/dl/page-speed/psol/${PAGESPEED_VERSION}-${ARCH}.tar.gz
sudo tar -xzvf ${PAGESPEED_VERSION}-${ARCH}.tar.gz

# headers more
cd ${SRC_NGINX}
sudo aria2c https://github.com/openresty/headers-more-nginx-module/archive/v0.32.tar.gz
sudo tar -zxvf headers-more-nginx-module-0.32.tar.gz

# cache purge
cd ${SRC_NGINX}
sudo aria2c https://github.com/FRiCKLE/ngx_cache_purge/archive/2.3.tar.gz
sudo tar -zxvf ngx_cache_purge-2.3.tar.gz

# test cookie
cd ${SRC_NGINX}
sudo aria2c https://github.com/kyprizel/testcookie-nginx-module/tarball/master
sudo tar -zxvf kyprizel-testcookie-nginx-module-*.tar.gz
sudo rm kyprizel-testcookie-nginx-module-*.tar.gz 
sudo mv kyprizel-testcookie-nginx-module-* kyprizel-testcookie-nginx-module

# nginx
cd ${SRC_NGINX}
sudo wget http://nginx.org/download/nginx-${NGINX_VERSION}.tar.gz
sudo tar -xvzf nginx-${NGINX_VERSION}.tar.gz

echo "$RED ~ Install : $GREEN MaxMind C API $RESET"
cd /tmp
sudo wget http://geolite.maxmind.com/download/geoip/api/c/GeoIP.tar.gz
sudo tar -zxvf GeoIP.tar.gz
cd GeoIP-*
./configure
make
make install

echo '/usr/local/lib' | sudo tee -a /etc/ld.so.conf.d/geoip.conf
sudo ldconfig
sudo ldconfig -v | grep GeoIP

echo "$RED ~ Configure : $GREEN NGINX $RESET"
cd ${SRC_NGINX}
cd nginx-${NGINX_VERSION}/
sudo ./configure \
  --prefix=/etc/nginx \
  --conf-path=/etc/nginx/nginx.conf \
  --sbin-path=/usr/sbin/nginx \
  --pid-path=/var/run/nginx.pid \
  --lock-path=/var/run/nginx.lock \
  --error-log-path=/var/log/nginx/error.log \
  --http-log-path=/var/log/nginx/access.log \
  --with-http_v2_module \
  --with-http_ssl_module \
  --with-http_realip_module \
  --with-http_gzip_static_module \
  --with-http_stub_status_module \
  --with-http_sub_module \
  --with-file-aio \
  --with-http_addition_module \
  --with-http_geoip_module \
  --add-module=${SRC_NGINX}/ngx_pagespeed-${PAGESPEED_VERSION}-stable \
  --add-module=${SRC_NGINX}/headers-more-nginx-module-0.32 \
  --add-module=${SRC_NGINX}/ngx_cache_purge-2.3 \
  --add-module=${SRC_NGINX}/kyprizel-testcookie-nginx-module

echo "$RED ~ Make : $GREEN NGINX $RESET"
make

echo "$RED ~ Install : $GREEN NGINX $RESET"
make install

# Create GeoIP directory for city and country databases
if [ ! -d /usr/local/share/GeoIP ]; then
  echo "$RED ~ Install : $GREEN MaxMind GeoCity and GeoCountry Databases $RESET"
  sudo mkdir -p /usr/local/share/GeoIP/
fi

sudo wget http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz -O /usr/local/share/GeoIP/GeoLiteCity.dat.gz
sudo gzip -d /usr/local/share/GeoIP/GeoLiteCity.dat.gz

sudo wget http://geolite.maxmind.com/download/geoip/database/GeoLiteCountry/GeoIP.dat.gz -O /usr/local/share/GeoIP/GeoIP.dat.gz
sudo gzip -d /usr/local/share/GeoIP/GeoIP.dat.gz

echo "$RED ~ Configure : $GREEN NGINX as a service $RESET"
cd /etc/systemd/system/
echo "[Unit]
Description=The NGINX HTTP and Reverse Proxy Server
After=syslog.target network.target remote-fs.target nss-lookup.target
[Service]
Type=forking
PIDFile=/var/run/nginx.pid
ExecStartPre=/usr/sbin/nginx -t
ExecStart=/usr/sbin/nginx
ExecReload=/bin/kill -s HUP \$MAINPID
ExecStop=/bin/kill -s QUIT \$MAINPID
PrivateTmp=true
[Install]
WantedBy=multi-user.target" | sudo tee nginx.service 

sudo systemctl enable nginx.service
sudo systemctl start nginx.service

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

# Set colors
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

# Detect OS
if [[ "$OSTYPE" == "linux"* ]]; then
  OS="linux"
elif [[ "$OSTYPE" == "darwin"* ]]; then
  OS="macos"
else
  OS="other"
fi
echo "$RED ~ Detect : $GREEN ${OS} $RESET"

# Continue only if OS is linux, macos will follow later.
if [ $OS == "linux" ]; then
  echo $BLUE $(uname -a) $RESET
else
  echo "$RED  Exiting.. $RESET"
  exit 1
fi

# Global variables
SRC_ROOT=/usr/src
NSRC_ROOT=/usr/src/nginx

# Versions
NGINX_VERSION=${NGINX_VERSION:=1.10.2}
NPS_VERSION=${NPS_VERSION:=1.11.33.4}

# create nginx source directory
if [ ! -d ${NSRC_ROOT} ]; then
  echo "$RED ~ Create : $GREEN $NSRC_ROOT $RESET"
  mkdir -p ${NSRC_ROOT}
fi

echo "$RED ~ Update : $GREEN Packages $RESET"
sudo apt-get update -q
sudo apt-get upgrade -y

echo "$RED ~ Install : $GREEN Packages and libraries $RESET"
sudo apt-get install -y build-essential openssl libssl-dev libssl-doc libgeoip-dev \
  fail2ban aria2 sysstat links libpcre3 libpcre3-dev zlibc zlib1g zlib1g-dev \
  perl libnet-ssleay-perl libauthen-pam-perl libpam-runtime libio-pty-perl \
  apt-show-versions htop iotop iftop xtail unzip git curl python python-setuptools ruby

echo "$RED ~ Download : $GREEN NGINX and its modules $RESET"
cd ${NSRC_ROOT}
sudo wget https://github.com/pagespeed/ngx_pagespeed/archive/release-${NPS_VERSION}-beta.zip
sudo unzip release-${NPS_VERSION}-beta.zip

cd ngx_pagespeed-release-${NPS_VERSION}-beta/
sudo wget https://dl.google.com/dl/page-speed/psol/${NPS_VERSION}.tar.gz
sudo tar -xzvf ${NPS_VERSION}.tar.gz

cd ${NSRC_ROOT}
sudo wget http://nginx.org/download/nginx-${NGINX_VERSION}.tar.gz
sudo tar -xvzf nginx-${NGINX_VERSION}.tar.gz

cd ${NSRC_ROOT}
sudo aria2c https://github.com/openresty/headers-more-nginx-module/archive/v0.32.tar.gz
sudo tar zxvf headers-more-nginx-module-0.32.tar.gz

sudo aria2c http://labs.frickle.com/files/ngx_cache_purge-2.3.tar.gz
sudo tar zxvf ngx_cache_purge-2.3.tar.gz

sudo aria2c https://github.com/kyprizel/testcookie-nginx-module/tarball/master
sudo mv kyprizel-testcookie-nginx-module-*.tar.gz kyprizel-testcookie-nginx.tar.gz
sudo tar zxvf kyprizel-testcookie-nginx.tar.gz

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
cd ${NSRC_ROOT}
cd nginx-${NGINX_VERSION}/
sudo ./configure --conf-path=/etc/nginx/nginx.conf \
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
  --with-ipv6 \
  --with-http_geoip_module \
  --with-debug \
  --add-module=${NSRC_ROOT}/ngx_pagespeed-release-${NPS_VERSION}-beta \
  --add-module=${NSRC_ROOT}/headers-more-nginx-module-0.32 \
  --add-module=${NSRC_ROOT}/ngx_cache_purge-2.3

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

echo "$RED ~ Install : $GREEN NGINX Amplify $RESET"
read -r -p "Do you want to install NGINX Amplify? [Y/n]: " amplify
if [[ $amplify =~ [yY](es)* ]]; then
  curl -L -O https://github.com/nginxinc/nginx-amplify-agent/raw/master/packages/install.sh

  read -r -p "Enter your NGINX Amplify key: " key
  API_KEY='${key}' sudo sh ./install.sh
fi

echo "$RED ~ Configure : $GREEN NGINX as a service $RESET"
cd /etc/systemd/system/
echo "[Unit]
Description=The NGINX HTTP and reverse proxy server
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

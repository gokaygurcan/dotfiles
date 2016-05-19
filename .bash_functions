#!/bin/bash

# .bash_functions
# ----------------------------

# create app icons
# usage: mkicns /path/to/file.ext
function mkicns() {
  if [[ -z "$@" ]]; then
    echo "Input file missing"
  else
    filename=${1%.*}
    mkdir $filename.iconset
    sips -z 16 16   $1 --out $filename.iconset/icon_16x16.png
    sips -z 32 32   $1 --out $filename.iconset/icon_16x16@2x.png
    sips -z 32 32   $1 --out $filename.iconset/icon_32x32.png
    sips -z 64 64   $1 --out $filename.iconset/icon_32x32@2x.png
    sips -z 128 128 $1 --out $filename.iconset/icon_128x128.png
    sips -z 256 256 $1 --out $filename.iconset/icon_128x128@2x.png
    sips -z 256 256 $1 --out $filename.iconset/icon_256x256.png
    sips -z 512 512 $1 --out $filename.iconset/icon_256x256@2x.png
    sips -z 512 512 $1 --out $filename.iconset/icon_512x512.png
    cp $1 $filename.iconset/icon_512x512@2x.png
    iconutil -c icns $filename.iconset
    rm -r $filename.iconset
  fi
}

# weather
weather () {
    curl http://wttr\.in/$1
}

# copy w/ progress
cp_p () {
  rsync -WavP --human-readable --progress $1 $2
}

# get gzipped size
function gz() {
	echo "orig size    (bytes): "
	cat "$1" | wc -c
	echo "gzipped size (bytes): "
	gzip -c "$1" | wc -c
}

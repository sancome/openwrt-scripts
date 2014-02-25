#!/bin/sh

#apt-get install g++ libncurses5-dev zlib1g-dev bison flex unzip autoconf gawk make gettext gettext texinfo sharutils gcc binutils ncurses-term patch bzip2 libbz2-dev libz-dev asciidoc subversion sphinxsearch libtool git git-core curl

cd ~/openwrt

git clone git://git.openwrt.org/openwrt.git barrier_breaker

cp ./barrier_breaker/feeds.conf.default ./barrier_breaker/feeds.conf

./barrier_breaker/scripts/feeds update -a
./barrier_breaker/scripts/feeds install -a

#save dl files to dl-barrier_breaker
if [ ! -d dl-barrier_breaker ]; then
    mkdir ~/openwrt/dl-barrier_breaker
fi

cd ~/openwrt/barrier_breaker

#create symbolic link to download directory
if [ ! -d dl ]; then
    ln -s ~/openwrt/dl-barrier_breaker dl
fi


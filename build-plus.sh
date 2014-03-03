#!/bin/sh

cd ~/openwrt

#download openwrt-plus
git clone git://github.com/sancome/openwrt-plus.git

#package install
cp -rf ./openwrt-plus/package/* ./barrier_breaker/package/

#patch openssl
patch -p0 ./barrier_breaker/package/libs/openssl/Makefile < ./barrier_breaker/package/libs/openssl/Makefile.diff
rm -rf ./barrier_breaker/package/libs/openssl/Makefile.diff

#copy new packages
cp -rf ./openwrt-plus/feeds/luci/* ./barrier_breaker/feeds/luci/

#patch luci
patch -p0 ./barrier_breaker/feeds/luci/contrib/package/luci/Makefile < ./barrier_breaker/feeds/luci/contrib/package/luci/Makefile.diff
rm -rf ./barrier_breaker/feeds/luci/contrib/package/luci/Makefile.diff

#patch luci config
patch -p0 ./barrier_breaker/feeds/luci/libs/web/root/etc/config/luci < ./barrier_breaker/feeds/luci/libs/web/root/etc/config/luci.diff
rm -rf ./barrier_breaker/feeds/luci/libs/web/root/etc/config/luci.diff

#copy config files
cp -rf ./openwrt-plus/files ./barrier_breaker/

#delete openwrt-plus
rm -rf ./openwrt-plus


#cd ~/openwrt/barrier_breaker
#cp ~/openwrt/openwrt_scripts/config.db120 ./.config
#make defconfig
#make menuconfig
#make V=99

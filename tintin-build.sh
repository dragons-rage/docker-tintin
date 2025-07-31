#!/bin/sh -x
# Grab Tintin source
USER=tintin

apk update && apk upgrade
apk add curl wget make pcre-dev gnutls-dev zlib-dev build-base

wget -L -O /tmp/tintin.tar.gz \
  "https://github.com/scandum/tintin/releases/download/${TINTIN_VERSION}/tintin-${TINTIN_VERSION}.tar.gz"

cd /tmp || exit 1
mkdir /config
adduser -D $USER
#echo "$USER ALL=(ALL) NOPASSWD: ALL" >/etc/sudoers.d/$USER
#chmod 0440 /etc/sudoers.d/$USER
chown -R $USER /config
tar -xf tintin.tar.gz

cd tt/src || exit 1
./configure && make && make install

cd /tmp || exit 1

rm -rf tintin.tar.gz tt

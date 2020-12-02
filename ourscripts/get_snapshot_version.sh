#!/usr/bin/env bash
versionname=$1
pathdownload=$(curl -s https://mcversions.net/download/$versionname | grep -Eo "(http|https)://[a-zA-Z0-9./?=_%:-]*" | grep 'server.jar')
wget -O /tmp/server.jar "$pathdownload"
sha512sum=$(sha512sum /tmp/server.jar | cut -d' ' -f1)
echo "SOURCE_URL=$pathdownload" > ../conf/vanilla/snapshot/$versionname.src
echo "SOURCE_SUM=$sha512sum" >> ../conf/vanilla/snapshot/$versionname.src
echo "SOURCE_SUM_PRG=sha512sum" >> ../conf/vanilla/snapshot/$versionname.src
echo "SOURCE_FORMAT=jar" >> ../conf/vanilla/snapshot/$versionname.src
echo "SOURCE_IN_SUBDIR=false" >> ../conf/vanilla/snapshot/$versionname.src
echo "SOURCE_EXTRACT=false" >> ../conf/vanilla/snapshot/$versionname.src
echo "SOURCE_FILENAME=server.jar" >> ../conf/vanilla/snapshot/$versionname.src

#!/usr/bin/env bash
stable=$(curl -s https://mcversions.net/ | grep -Eo "/download/[a-zA-Z0-9./?=_%:-]*" | cut -d'/' -f3 | egrep -v "^rd|^c0|^a1|^b1|^inf|w|pre|Pre|rc")
for stversionname in $stable; do
    if test -f "../conf/vanilla/stable/$stversionname.src"; then
        continue
    else
        if [[ "$stversionname" == "1.0" || "$stversionname" == "1.1" || "$stversionname" == "1.2.1" || "$stversionname" == "1.2.2" || "$stversionname" == "1.2.3" || "$stversionname" == "1.2.4" ]]; then
          #echo "$stversionname.src is ignored"
          continue
        else
          echo "$stversionname.src does not exist"
          echo "Start download...."
          pathdownload=$(curl -s https://mcversions.net/download/$stversionname| grep -Eo "(http|https)://[a-zA-Z0-9./?=_%:-]*" | grep 'server.jar')
          wget -qO /tmp/server.jar "$pathdownload"
          sha512sum=$(sha512sum /tmp/server.jar | cut -d' ' -f1)
          echo "SOURCE_URL=$pathdownload" > ../conf/vanilla/stable/$stversionname.src
          echo "SOURCE_SUM=$sha512sum" >> ../conf/vanilla/stable/$stversionname.src
          echo "SOURCE_SUM_PRG=sha512sum" >> ../conf/vanilla/stable/$stversionname.src
          echo "SOURCE_FORMAT=jar" >> ../conf/vanilla/stable/$stversionname.src
          echo "SOURCE_IN_SUBDIR=false" >> ../conf/vanilla/stable/$stversionname.src
          echo "SOURCE_EXTRACT=false" >> ../conf/vanilla/stable/$stversionname.src
          echo "SOURCE_FILENAME=server.jar" >> ../conf/vanilla/stable/$stversionname.src
          echo "Download is finish."
        fi

    fi
done

snapshot=$(curl -s https://mcversions.net/ | grep -Eo "/download/[a-zA-Z0-9./?=_%:-]*" | cut -d'/' -f3 | egrep -v "3D-" | egrep "w")
for snversionname in $snapshot; do
    if test -f "../conf/vanilla/snapshot/$snversionname.src"; then
        continue
    else
        echo "$snversionname.src does not exist"
        echo "Start download...."
        pathdownload=$(curl -s https://mcversions.net/download/$snversionname| grep -Eo "(http|https)://[a-zA-Z0-9./?=_%:-]*" | grep 'server.jar')
        wget -qO /tmp/server.jar "$pathdownload"
        sha512sum=$(sha512sum /tmp/server.jar | cut -d' ' -f1)
        echo "SOURCE_URL=$pathdownload" > ../conf/vanilla/snapshot/$snversionname.src
        echo "SOURCE_SUM=$sha512sum" >> ../conf/vanilla/snapshot/$snversionname.src
        echo "SOURCE_SUM_PRG=sha512sum" >> ../conf/vanilla/snapshot/$snversionname.src
        echo "SOURCE_FORMAT=jar" >> ../conf/vanilla/snapshot/$snversionname.src
        echo "SOURCE_IN_SUBDIR=false" >> ../conf/vanilla/snapshot/$snversionname.src
        echo "SOURCE_EXTRACT=false" >> ../conf/vanilla/snapshot/$snversionname.src
        echo "SOURCE_FILENAME=server.jar" >> ../conf/vanilla/snapshot/$snversionname.src
        echo "Download is finish."

    fi
done

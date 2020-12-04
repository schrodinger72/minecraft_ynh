#!/usr/bin/env bash
stable=$(sh list_stable.sh)
stable_got=0
for stversionname in $stable; do
    if test -f "../conf/vanilla/stable/$stversionname.src"; then
        continue
    else
        if [[ "$stversionname" == "1.0" || "$stversionname" == "1.1" || "$stversionname" == "1.2.1" || "$stversionname" == "1.2.2" || "$stversionname" == "1.2.3" || "$stversionname" == "1.2.4" ]]; then
          #echo "$stversionname.src is ignored"
          continue
        else
          ((stable_got++))
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

snapshot=$(sh list_snapshot.sh)
snapshot_got=0
for snversionname in $snapshot; do
    if test -f "../conf/vanilla/snapshot/$snversionname.src"; then
        continue
    else
        ((snapshot_got++))
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
if [[ $stable_got -ge 1 || $snapshot_got -ge 1 ]]; then
  echo "Finished. Retrieved: $stable_got stables and $snapshot_got snapshots"
else
  echo "Finished. Nothing new"
fi

#!/usr/bin/env bash
for line in $(sh list_snapshot.sh); do echo "GETTING SNAPSHOT VERSION $line" ; sh get_snapshot_version.sh "$line" ; done

#!/usr/bin/env bash
for line in $(sh list_stable.sh); do echo "GETTING VERSION $line" ; sh get_stable_version.sh "$line" ; done

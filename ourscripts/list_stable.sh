#!/usr/bin/env bash
curl -s https://mcversions.net/ | grep -Eo "/download/[a-zA-Z0-9./?=_%:-]*" | cut -d'/' -f3 | egrep -v "^rd|^c0|^a1|^b1|^inf|w|pre|Pre|rc"

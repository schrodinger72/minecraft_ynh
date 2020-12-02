#!/usr/bin/env bash
curl -s https://mcversions.net/ | grep -Eo "/download/[a-zA-Z0-9./?=_%:-]*" | cut -d'/' -f3 | egrep -v "3D-" | egrep "w"

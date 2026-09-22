#!/usr/bin/env bash
set -euo pipefail

color_red="scarlet"
color_blue="navy"
color_green="forest"

selected="color_blue"
echo "selected color is: ${!selected}"

for name in "${!color_@}"; do
    echo "$name = ${!name}"
done

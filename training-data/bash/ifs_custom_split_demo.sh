#!/usr/bin/env bash
set -euo pipefail

record="name:Alice:age:30:city:NYC"

old_ifs="$IFS"
IFS=':' read -r -a fields <<<"$record"
IFS="$old_ifs"

for field in "${fields[@]}"; do
    echo "field: $field"
done

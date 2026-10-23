#!/usr/bin/env bash
set -euo pipefail

# declare attributes change how a variable stores values:
#   -i integer (assignments are evaluated arithmetically)
#   -u uppercase on assignment   -l lowercase on assignment
#   -r readonly                  -x exported
declare -i count=5
count=count*3+1
echo "count = $count"

count+=4          # += is arithmetic addition for integer variables
echo "count after += 4: $count"

declare -i total
total="12 + 30"
echo "expression stored as: $total"

declare -u shout="make me loud"
echo "$shout"

declare -l quiet="MAKE ME QUIET"
echo "$quiet"

shout="reassigned stays upper"
echo "$shout"

declare -r LIMIT=10
if ! (LIMIT=11) 2>/dev/null; then
  echo "LIMIT is readonly"
fi

# Inspect attributes with declare -p.
declare -p count shout quiet LIMIT

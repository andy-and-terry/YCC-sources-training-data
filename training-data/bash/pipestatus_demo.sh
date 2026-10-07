#!/usr/bin/env bash

# Without pipefail, a pipeline's status is that of the last command.
false | true
echo "status of 'false | true': $?"

# PIPESTATUS keeps the status of every stage.
true | false | true
statuses=("${PIPESTATUS[@]}")
echo "PIPESTATUS: ${statuses[*]}"

# Find which stage failed
printf 'a\nb\n' | grep -q zzz | cat
echo "stages: ${PIPESTATUS[*]}"

# pipefail makes the whole pipeline fail if any stage fails
set -o pipefail
if ! printf 'a\nb\n' | grep -q zzz; then
    echo "pipeline failed under pipefail"
fi
set +o pipefail

#!/usr/bin/env bash
# Without pipefail a pipeline's status is the last command's; PIPESTATUS shows each.
false | true
echo "plain: $?"

set -o pipefail
false | true
echo "pipefail: $?"

true | false | true
echo "${PIPESTATUS[@]}"

if ! grep -q needle <<< "haystack"; then echo "not found"; fi
command -v nonexistent_cmd >/dev/null 2>&1 || echo "missing command"

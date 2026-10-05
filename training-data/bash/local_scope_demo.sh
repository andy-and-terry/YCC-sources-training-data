#!/usr/bin/env bash
set -euo pipefail

x="global"

shadow() {
    local x="local"
    echo "inside shadow: $x"
    inner
}

# Bash uses dynamic scoping: inner sees the caller's local x.
inner() {
    echo "inside inner: $x"
}

leak() {
    y="leaked"
}

shadow
echo "after shadow: $x"
leak
echo "y is $y"

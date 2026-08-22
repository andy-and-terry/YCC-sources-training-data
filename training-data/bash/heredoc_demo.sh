#!/usr/bin/env bash
set -euo pipefail

name="Ada"
cat <<EOF
Hello, $name!
This is a heredoc example.
Multiple lines are supported.
EOF

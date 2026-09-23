#!/usr/bin/env bash
set -euo pipefail

echo "Ada" | { read -r -p "Enter name: " name; echo; echo "Hello, $name!"; }

if read -r -t 1 -p "Waiting: " reply < /dev/null; then
    echo "got: $reply"
else
    echo "no input received"
fi

echo "secret123" | { read -r -s -p "Password: " pass; echo; echo "length: ${#pass}"; }

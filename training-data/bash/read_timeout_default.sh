#!/usr/bin/env bash
# read -t gives up after a timeout; -p prompts; -n limits characters

ask() {
  local prompt=$1 default=$2 reply
  if read -r -t 2 -p "$prompt [$default]: " reply; then
    echo "${reply:-$default}"
  else
    echo >&2
    echo "(timed out, using default)" >&2
    echo "$default"
  fi
}

name=$(ask "Your name" "guest" </dev/null)
echo "Hello, $name"

# Read a single character without waiting for Enter
printf 'y' | { read -r -n 1 -t 1 key && echo "key pressed: $key"; }

# Exit status > 128 means the read timed out
sleep 5 | read -r -t 1 _
status=${PIPESTATUS[1]}
echo "read status: $status"
(( status > 128 )) && echo "timeout detected"

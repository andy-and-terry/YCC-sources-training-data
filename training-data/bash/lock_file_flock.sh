#!/usr/bin/env bash
exec 9>/tmp/demo.lock
if ! flock -n 9; then
    echo "another instance is running" >&2
    exit 1
fi
echo "got the lock"
sleep 1

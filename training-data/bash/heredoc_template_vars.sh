#!/usr/bin/env bash
name="Ann"; count=3
cat <<EOF
Hello $name,
You have $count new messages.
Total: $((count * 2))
EOF
cat <<'RAW'
No $expansion here
RAW

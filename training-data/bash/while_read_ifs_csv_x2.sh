#!/usr/bin/env bash
while IFS=, read -r name age; do
  echo "$name is $age"
done <<'EOF'
ann,30
bob,25
EOF

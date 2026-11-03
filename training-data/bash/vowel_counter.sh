#!/usr/bin/env bash
text=$(echo "Education is beautiful" | tr 'A-Z' 'a-z')
for v in a e i o u; do
  only=${text//[^$v]/}
  printf '%s=%d ' "$v" "${#only}"
done
echo

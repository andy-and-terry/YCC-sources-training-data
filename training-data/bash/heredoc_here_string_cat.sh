#!/usr/bin/env bash
name=world
cat <<EOF
hello $name
EOF
cat <<'EOF'
literal $name
EOF
wc -w <<< "one two three"

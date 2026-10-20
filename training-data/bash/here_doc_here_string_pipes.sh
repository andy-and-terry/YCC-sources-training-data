#!/usr/bin/env bash
set -euo pipefail

USER_NAME_DEFAULT=ada
cat <<EOF
User: $USER_NAME_DEFAULT
EOF
cat <<-EOF
	indented tabs stripped for $USER_NAME_DEFAULT
EOF
cat <<'EOF'
literal $notexpanded
EOF
wc -w <<< "one two three"
read -r a b <<< "first second"
echo "$b $a"

#!/usr/bin/env bash
user=${USER:-someone}
cat <<EOF
Dear $user,
Today is $(date +%A).
Total: \$$(( 6 * 7 ))
EOF
cat <<'EOF'
No $expansion here.
EOF

#!/usr/bin/env bash
# Here-documents (with and without expansion) and here-strings.
user=${USER:-someone}
cat <<EOF2
Hello, $user
Today is a fine day.
EOF2

cat <<'RAW'
Literal $user and $(date) are not expanded.
RAW

cat <<-INDENTED
	tabs stripped from the start
	of each line
INDENTED

read -r first rest <<< "alpha beta gamma"
echo "$first | $rest"
grep -c a <<< $'banana\ncherry\napple'

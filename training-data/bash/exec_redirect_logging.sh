#!/usr/bin/env bash
# exec redirects every following command's stdout to a file.
log=$(mktemp)
exec 3>&1 >"$log"
echo "this goes to the log"
echo "so does this"
exec >&3 3>&-
echo "back on the terminal; log has $(wc -l < "$log") lines"
rm -f "$log"

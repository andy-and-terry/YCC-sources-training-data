#!/usr/bin/awk -f
# Usage: awk -f merge_columns_by_key.awk names.txt scores.txt
# Both files: key value. Output: key name score
FNR == NR { name[$1] = $2; next }
$1 in name { print $1, name[$1], $2 }

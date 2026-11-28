NR == FNR { name[$1] = $2; next }
($1 in name) { print $1, name[$1], $2 }

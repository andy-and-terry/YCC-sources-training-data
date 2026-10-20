BEGIN { FS = "," }
NR == 1 { for (i = 1; i <= NF; i++) col[$i] = i; next }
{ print $col["name"], $col["age"] + 1 }

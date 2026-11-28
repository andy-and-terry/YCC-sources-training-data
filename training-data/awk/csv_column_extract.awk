BEGIN { FS = ","; OFS = "\t" }
NR > 1 { print $1, $3 }

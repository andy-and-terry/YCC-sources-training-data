BEGIN { FS = ","; OFS = "\t" }
NR == 1 { print "HEADER:", $0; next }
{ print $3, $1, $2 }

BEGIN { FS = ","; OFS = "\t" }
{ $1 = $1; print }

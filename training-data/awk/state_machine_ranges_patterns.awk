#!/usr/bin/awk -f
/^BEGIN_BLOCK/ { inblock = 1; next }
/^END_BLOCK/ { inblock = 0; blocks++; next }
inblock { lines++; words += NF }
/ERROR/ && !inblock { errs++ }
$1 ~ /^[0-9]+$/ { nums++ }
NR % 2 == 0 { even++ }
END {
    print "blocks=" blocks + 0, "lines=" lines + 0, "words=" words + 0
    print "errors=" errs + 0, "numeric=" nums + 0, "even rows=" even + 0
}

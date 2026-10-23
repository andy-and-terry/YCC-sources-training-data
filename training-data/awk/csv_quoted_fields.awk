# Parse CSV lines with quoted fields containing commas using FPAT
BEGIN { FPAT = "([^,]*)|(\"([^\"]|\"\")*\")" }
{
    for (i = 1; i <= NF; i++) {
        f = $i
        if (f ~ /^".*"$/) {
            f = substr(f, 2, length(f) - 2)
            gsub(/""/, "\"", f)
        }
        printf "%d:[%s] ", i, f
    }
    print ""
}

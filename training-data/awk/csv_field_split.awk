BEGIN { FS = "," }
NR > 1 {
    printf "%s is %d years old\n", $1, $2
}

# Greedy word wrap at width W (default 15):  awk -v W=20 -f word_wrap_greedy.awk
BEGIN { if (W == "") W = 15 }
{
    for (i = 1; i <= NF; i++) {
        if (line != "" && length(line) + 1 + length($i) > W) {
            printf "|%-*s|\n", W, line
            line = $i
        } else {
            line = (line == "" ? $i : line " " $i)
        }
    }
}
END { if (line != "") printf "|%-*s|\n", W, line }
# try: echo "the quick brown fox jumps over the lazy dog" | awk -f word_wrap_greedy.awk

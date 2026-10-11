#!/usr/bin/awk -f
# Count lines containing both "error" and "disk"
/error/ && /disk/ { n++ }
END { print n + 0, "lines matched both patterns" }

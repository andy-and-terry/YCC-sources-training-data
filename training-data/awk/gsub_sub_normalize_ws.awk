BEGIN { s = "  too   many   spaces  "
        gsub(/[ \t]+/, " ", s); sub(/^ /, "", s); sub(/ $/, "", s)
        print "[" s "]" }

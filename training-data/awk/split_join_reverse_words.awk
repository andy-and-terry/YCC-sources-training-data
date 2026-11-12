BEGIN { n = split("one two three four", w, " ")
        for (i = n; i >= 1; i--) out = out w[i] (i > 1 ? " " : "")
        print out }

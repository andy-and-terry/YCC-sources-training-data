BEGIN { s = "order #4521 shipped"
        if (match(s, /#[0-9]+/)) print substr(s, RSTART + 1, RLENGTH - 1), RSTART, RLENGTH }

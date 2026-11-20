# Remove consecutive duplicates.
dedupe(xs) = [x for (i, x) in enumerate(xs) if i == 1 || x != xs[i-1]]
println(String(dedupe(collect("aabbbcdd"))))

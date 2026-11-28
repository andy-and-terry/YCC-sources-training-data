n = 8
for r in 0:n-1
    println(" "^(n - r - 1), join((r & c) == c ? "* " : "  " for c in 0:r))
end

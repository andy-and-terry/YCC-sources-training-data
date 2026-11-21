# Count bouncy numbers (neither increasing nor decreasing digits) below 1000.
function is_bouncy(n)
    d = digits(n)
    return !issorted(d) && !issorted(d, rev = true)
end

println(count(is_bouncy, 1:999))

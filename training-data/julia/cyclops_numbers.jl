# Cyclops numbers: odd digit count, middle digit zero, no other zeros.
# Count those in 1..99999 (expected 6642).
function is_cyclops(n)
    s = string(n)
    len = length(s)
    return isodd(len) && s[len ÷ 2 + 1] == '0' && count(==('0'), s) == 1
end

println(count(is_cyclops, 1:99999))

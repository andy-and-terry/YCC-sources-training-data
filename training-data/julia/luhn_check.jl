function luhn_valid(input::AbstractString)
    s = replace(input, " " => "")
    (length(s) < 2 || !all(isdigit, s)) && return false
    total = 0
    for (i, c) in enumerate(reverse(s))
        d = c - '0'
        if iseven(i)
            d *= 2
            d > 9 && (d -= 9)
        end
        total += d
    end
    return total % 10 == 0
end

println(luhn_valid("4539 3195 0343 6467"), " ", luhn_valid("8273 1232 7352 0569"))

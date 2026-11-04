function ordinal(n::Integer)
    suffix = if 11 <= n % 100 <= 13
        "th"
    else
        get(Dict(1 => "st", 2 => "nd", 3 => "rd"), n % 10, "th")
    end
    string(n, suffix)
end

println(join(ordinal.([1, 2, 3, 4, 11, 12, 13, 21, 101, 111]), " "))

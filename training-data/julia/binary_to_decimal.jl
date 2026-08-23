function binary_to_decimal(s::String)
    return parse(Int, s, base=2)
end

println(binary_to_decimal("1011"))

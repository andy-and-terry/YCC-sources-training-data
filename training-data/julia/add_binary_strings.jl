function add_binary(a::String, b::String)
    i, j, carry = length(a), length(b), 0
    out = Char[]
    while i > 0 || j > 0 || carry > 0
        s = carry
        i > 0 && (s += a[i] - '0'; i -= 1)
        j > 0 && (s += b[j] - '0'; j -= 1)
        push!(out, '0' + s % 2)
        carry = s ÷ 2
    end
    return String(reverse(out))
end

println(add_binary("1010", "1011")) # 10101

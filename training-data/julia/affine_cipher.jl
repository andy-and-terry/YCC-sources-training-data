modinverse(a, m) = first(x for x in 1:m-1 if a * x % m == 1)

function affine(s, a, b; decrypt = false)
    inv = modinverse(a, 26)
    map(s) do ch
        isuppercase(ch) || return ch
        x = ch - 'A'
        y = decrypt ? mod(inv * (x - b), 26) : (a * x + b) % 26
        Char('A' + y)
    end
end

c = affine("AFFINE", 5, 8)
println(c, " ", affine(c, 5, 8; decrypt = true))

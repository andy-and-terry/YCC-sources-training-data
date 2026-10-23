function divmod_pair(a, b)
    return a ÷ b, a % b
end

q, r = divmod_pair(17, 5)
println("q=$q r=$r")

first, rest... = [1, 2, 3, 4]
println(first)
println(rest)

(a, b), c = (1, 2), 3
println(a + b + c)

nt = (x = 10, y = 20)
(; x, y) = nt
println(x * y)

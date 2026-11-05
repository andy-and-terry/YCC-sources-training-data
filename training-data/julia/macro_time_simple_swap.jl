macro swap(a, b)
    quote
        tmp = $(esc(a))
        $(esc(a)) = $(esc(b))
        $(esc(b)) = tmp
    end
end

x, y = 1, 2
@swap x y
println(x, " ", y)

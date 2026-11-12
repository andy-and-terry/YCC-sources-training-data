macro twice(ex)
    quote
        $(esc(ex)); $(esc(ex))
    end
end
n = 0
@twice n += 1
println(n)

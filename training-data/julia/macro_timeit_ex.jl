macro twice(ex)
    quote
        $(esc(ex))
        $(esc(ex))
    end
end

n = 0
@twice n += 5
println(n)
println(@elapsed sum(1:1000) >= 0)

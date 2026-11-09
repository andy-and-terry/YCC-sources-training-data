ch = Channel{Int}(4)
@async begin
    for i in 1:3
        put!(ch, i^2)
    end
    close(ch)
end
for v in ch
    println(v)
end

ch = Channel{Int}(4)
producer = @async begin
    for i in 1:5
        put!(ch, i^2)
    end
    close(ch)
end
for v in ch
    print(v, " ")
end
println()
wait(producer)

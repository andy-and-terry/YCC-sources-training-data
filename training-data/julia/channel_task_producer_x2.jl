ch = Channel{Int}(4)
@async begin
    for i in 1:5; put!(ch, i^2); end
    close(ch)
end
println(sum(ch))

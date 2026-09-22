function producer(ch::Channel, n::Int)
    for i in 1:n
        put!(ch, i * i)
    end
    close(ch)
end

ch = Channel{Int}(4)
@async producer(ch, 5)

for value in ch
    println(value)
end

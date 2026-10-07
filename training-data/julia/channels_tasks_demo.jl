function producer(ch::Channel{Int}, n::Int)
    for i in 1:n
        put!(ch, i * i)
    end
    close(ch)
end

function consume_all(ch::Channel{Int})
    results = Int[]
    for value in ch
        push!(results, value)
    end
    return results
end

channel = Channel{Int}(4)
task = @async producer(channel, 5)
squares = consume_all(channel)
wait(task)
println(squares)

# Fan-out: multiple worker tasks pulling from a shared work channel.
function worker(id::Int, jobs::Channel{Int}, results::Channel{Tuple{Int,Int}})
    for job in jobs
        put!(results, (id, job * 2))
    end
end

jobs = Channel{Int}(10)
results = Channel{Tuple{Int,Int}}(10)
for j in 1:6
    put!(jobs, j)
end
close(jobs)

workers = [@async worker(id, jobs, results) for id in 1:3]
for w in workers
    wait(w)
end
close(results)

doubled = sort([r[2] for r in results])
println(doubled)

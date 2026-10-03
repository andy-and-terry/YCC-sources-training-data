# @async schedules a Task on the same OS thread's event loop (green
# threading via coroutines); @sync waits for every @async block created
# in its scope to finish before continuing.
function fetch_value(id::Int)
    sleep(0.01)
    return id * id
end

results = Int[]
@sync begin
    for i in 1:5
        @async push!(results, fetch_value(i))
    end
end
println(sort(results))

task = @async begin
    sleep(0.01)
    "task finished"
end
println(fetch(task))

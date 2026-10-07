# Tasks are lightweight coroutines scheduled cooperatively.
t = @async begin
    sleep(0.05)
    42
end
println("task started: ", !istaskdone(t))
println("result: ", fetch(t))

tasks = [@async (sleep(0.01 * i); i^2) for i in 1:4]
println(map(fetch, tasks))

failing = @async error("boom")
try
    wait(failing)
catch e
    println("caught: ", e isa TaskFailedException)
end

@sync begin
    for i in 1:3
        @async println("sync child ", i)
    end
end
println("all children done")

c = Condition()
waiter = @async (wait(c); "woken")
yield()
notify(c)
println(fetch(waiter))

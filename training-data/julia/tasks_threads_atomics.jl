t = @async begin
    sleep(0.01)
    42
end
println(fetch(t))
results = Vector{Int}(undef, 4)
@sync for i in 1:4
    @async results[i] = i^2
end
println(results)
lock_ = ReentrantLock()
total = Ref(0)
@sync for i in 1:10
    @async lock(lock_) do
        total[] += i
    end
end
println(total[])
ch = Channel{Int}(2)
producer = @async (for i in 1:3 put!(ch, i) end; close(ch))
println([x for x in ch])
a = Threads.Atomic{Int}(0)
Threads.@threads for i in 1:100
    Threads.atomic_add!(a, 1)
end
println(a[], " ", Threads.nthreads() >= 1)
println(istaskdone(t), " ", fetch(Threads.@spawn 1 + 1))

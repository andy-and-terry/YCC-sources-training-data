using Base.Threads

# A ReentrantLock protects shared state; the same task may re-acquire it.
lk = ReentrantLock()
shared = Int[]

function add_item(x)
    lock(lk) do
        push!(shared, x)
    end
end

function add_twice(x)
    lock(lk) do
        add_item(x)     # re-acquires the lock held by this task
        add_item(x + 1)
    end
end

@sync for i in 1:4
    Threads.@spawn add_twice(10 * i)
end
println(sort(shared))

println(islocked(lk))
lock(lk)
println(islocked(lk))
unlock(lk)
println(trylock(lk))
unlock(lk)

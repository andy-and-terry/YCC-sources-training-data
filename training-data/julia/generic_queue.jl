mutable struct Queue{T}
    items::Vector{T}
    Queue{T}() where T = new(T[])
end

function enqueue!(q::Queue{T}, x::T) where T
    push!(q.items, x)
end

function dequeue!(q::Queue{T}) where T
    return popfirst!(q.items)
end

is_empty(q::Queue) = isempty(q.items)

q = Queue{Int}()
enqueue!(q, 1)
enqueue!(q, 2)
enqueue!(q, 3)
println(dequeue!(q))
println(dequeue!(q))
println(is_empty(q))

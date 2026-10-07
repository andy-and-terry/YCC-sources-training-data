mutable struct TwoStackQueue
    in_stack::Vector{Int}
    out_stack::Vector{Int}
    TwoStackQueue() = new(Int[], Int[])
end

function enqueue!(q::TwoStackQueue, x::Int)
    push!(q.in_stack, x)
end

function dequeue!(q::TwoStackQueue)
    if isempty(q.out_stack)
        while !isempty(q.in_stack)
            push!(q.out_stack, pop!(q.in_stack))
        end
    end
    return pop!(q.out_stack)
end

q = TwoStackQueue()
enqueue!(q, 1)
enqueue!(q, 2)
enqueue!(q, 3)
println(dequeue!(q))
println(dequeue!(q))
enqueue!(q, 4)
println(dequeue!(q))

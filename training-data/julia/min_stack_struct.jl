mutable struct MinStack{T<:Real}
    items::Vector{Tuple{T,T}}
end
MinStack{T}() where {T<:Real} = MinStack{T}(Tuple{T,T}[])

function Base.push!(s::MinStack{T}, x::T) where {T}
    m = isempty(s.items) ? x : min(x, s.items[end][2])
    push!(s.items, (x, m))
    return s
end

Base.pop!(s::MinStack) = pop!(s.items)[1]
minimum_value(s::MinStack) = s.items[end][2]

s = MinStack{Int}()
foreach(v -> push!(s, v), [5, 3, 7, 2])
println(minimum_value(s))
pop!(s)
println(minimum_value(s))

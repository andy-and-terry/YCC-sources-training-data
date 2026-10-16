using Base.Iterators: partition

function chunk(v::AbstractVector, n::Int)
    [v[i:min(i + n - 1, end)] for i in 1:n:length(v)]
end

data = collect(1:10)
println(chunk(data, 4))
println(collect(partition(data, 3)))
println(map(sum, partition(data, 5)))

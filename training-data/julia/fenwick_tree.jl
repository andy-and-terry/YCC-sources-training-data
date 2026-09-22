mutable struct FenwickTree
    tree::Vector{Int}
    n::Int
    FenwickTree(n::Int) = new(zeros(Int, n + 1), n)
end

function update!(ft::FenwickTree, index::Int, delta::Int)
    i = index
    while i <= ft.n
        ft.tree[i] += delta
        i += i & (-i)
    end
end

function prefix_sum(ft::FenwickTree, index::Int)
    total = 0
    i = index
    while i > 0
        total += ft.tree[i]
        i -= i & (-i)
    end
    return total
end

function range_sum(ft::FenwickTree, left::Int, right::Int)
    return prefix_sum(ft, right) - prefix_sum(ft, left - 1)
end

ft = FenwickTree(10)
for (i, v) in enumerate([3, 2, -1, 6, 5, 4, -3, 3, 7, 2])
    update!(ft, i, v)
end
println(range_sum(ft, 1, 5))
println(range_sum(ft, 4, 10))
update!(ft, 3, 4)
println(range_sum(ft, 1, 5))

mutable struct FenwickTree
    tree::Vector{Int}
    n::Int
    FenwickTree(n::Int) = new(zeros(Int, n + 1), n)
end

function update!(ft::FenwickTree, i::Int, delta::Int)
    i += 1
    while i <= ft.n
        ft.tree[i] += delta
        i += i & (-i)
    end
end

function prefix_sum(ft::FenwickTree, i::Int)
    i += 1
    total = 0
    while i > 0
        total += ft.tree[i]
        i -= i & (-i)
    end
    return total
end

function range_sum(ft::FenwickTree, l::Int, r::Int)
    return prefix_sum(ft, r) - (l == 0 ? 0 : prefix_sum(ft, l - 1))
end

ft = FenwickTree(8)
values = [3, 2, -1, 6, 5, 4, -3, 3]
for (i, v) in enumerate(values)
    update!(ft, i - 1, v)
end

println(prefix_sum(ft, 4))
println(range_sum(ft, 2, 5))

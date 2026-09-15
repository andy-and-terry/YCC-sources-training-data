mutable struct SegmentTree
    n::Int
    tree::Vector{Int}
    SegmentTree(data::Vector{Int}) = build(data)
end

function build(data::Vector{Int})
    n = length(data)
    tree = zeros(Int, 2 * n)
    for i in 1:n
        tree[n + i] = data[i]
    end
    for i in (n - 1):-1:1
        tree[i] = tree[2 * i] + tree[2 * i + 1]
    end
    st = SegmentTree(n, tree)
    return st
end

function update!(st::SegmentTree, index::Int, value::Int)
    i = index + st.n
    st.tree[i] = value
    while i > 1
        i = div(i, 2)
        st.tree[i] = st.tree[2 * i] + st.tree[2 * i + 1]
    end
end

function query(st::SegmentTree, left::Int, right::Int)
    l = left + st.n
    r = right + st.n
    total = 0
    while l < r
        if isodd(l)
            total += st.tree[l]
            l += 1
        end
        if isodd(r)
            r -= 1
            total += st.tree[r]
        end
        l = div(l, 2)
        r = div(r, 2)
    end
    return total
end

data = [1, 3, 5, 7, 9, 11]
st = SegmentTree(data)
println(query(st, 1, 4))
update!(st, 1, 10)
println(query(st, 1, 4))

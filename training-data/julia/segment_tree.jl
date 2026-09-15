mutable struct SegmentTree
    n::Int
    arr::Vector{Int}
    tree::Vector{Int}
end

function SegmentTree(data::Vector{Int})
    n = length(data)
    tree = zeros(Int, 4 * n)
    st = SegmentTree(n, data, tree)
    build!(st, 1, 1, n)
    return st
end

function build!(st::SegmentTree, node::Int, start::Int, stop::Int)
    if start == stop
        st.tree[node] = st.arr[start]
        return
    end
    mid = div(start + stop, 2)
    build!(st, 2 * node, start, mid)
    build!(st, 2 * node + 1, mid + 1, stop)
    st.tree[node] = st.tree[2 * node] + st.tree[2 * node + 1]
end

function update!(st::SegmentTree, node::Int, start::Int, stop::Int, index::Int, value::Int)
    if start == stop
        st.tree[node] = value
        return
    end
    mid = div(start + stop, 2)
    if index <= mid
        update!(st, 2 * node, start, mid, index, value)
    else
        update!(st, 2 * node + 1, mid + 1, stop, index, value)
    end
    st.tree[node] = st.tree[2 * node] + st.tree[2 * node + 1]
end

function query(st::SegmentTree, node::Int, start::Int, stop::Int, l::Int, r::Int)
    if r < start || stop < l
        return 0
    end
    if l <= start && stop <= r
        return st.tree[node]
    end
    mid = div(start + stop, 2)
    return query(st, 2 * node, start, mid, l, r) + query(st, 2 * node + 1, mid + 1, stop, l, r)
end

data = [1, 3, 5, 7, 9, 11]
st = SegmentTree(data)
println(query(st, 1, 1, st.n, 2, 4))
update!(st, 1, 1, st.n, 2, 10)
println(query(st, 1, 1, st.n, 2, 4))

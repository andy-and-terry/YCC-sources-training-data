mutable struct BinaryHeap
    data::Vector{Int}
    BinaryHeap() = new(Int[])
end

function push_heap!(heap::BinaryHeap, value::Int)
    push!(heap.data, value)
    i = length(heap.data)
    while i > 1
        parent = div(i, 2)
        if heap.data[parent] > heap.data[i]
            heap.data[parent], heap.data[i] = heap.data[i], heap.data[parent]
            i = parent
        else
            break
        end
    end
end

function pop_heap!(heap::BinaryHeap)
    top = heap.data[1]
    heap.data[1] = heap.data[end]
    pop!(heap.data)
    i = 1
    n = length(heap.data)
    while true
        left = 2i
        right = 2i + 1
        smallest = i
        if left <= n && heap.data[left] < heap.data[smallest]
            smallest = left
        end
        if right <= n && heap.data[right] < heap.data[smallest]
            smallest = right
        end
        if smallest == i
            break
        end
        heap.data[i], heap.data[smallest] = heap.data[smallest], heap.data[i]
        i = smallest
    end
    return top
end

heap = BinaryHeap()
for v in [5, 3, 8, 1, 9, 2]
    push_heap!(heap, v)
end
sorted = Int[]
while !isempty(heap.data)
    push!(sorted, pop_heap!(heap))
end
println(sorted)

mutable struct DNode
    value::Int
    prev::Union{DNode, Nothing}
    next::Union{DNode, Nothing}
    DNode(v::Int) = new(v, nothing, nothing)
end

mutable struct DoublyLinkedList
    head::Union{DNode, Nothing}
    tail::Union{DNode, Nothing}
    DoublyLinkedList() = new(nothing, nothing)
end

function push_back!(list::DoublyLinkedList, value::Int)
    node = DNode(value)
    if list.tail === nothing
        list.head = node
        list.tail = node
    else
        node.prev = list.tail
        list.tail.next = node
        list.tail = node
    end
end

function to_vector(list::DoublyLinkedList)
    result = Int[]
    node = list.head
    while node !== nothing
        push!(result, node.value)
        node = node.next
    end
    return result
end

list = DoublyLinkedList()
for v in [1, 2, 3, 4]
    push_back!(list, v)
end
println(to_vector(list))

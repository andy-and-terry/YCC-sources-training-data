mutable struct SkipNode
    value::Int
    forward::Vector{Union{SkipNode, Nothing}}
    SkipNode(value::Int, level::Int) = new(value, fill(nothing, level + 1))
end

mutable struct SkipList
    max_level::Int
    head::SkipNode
    level::Int
    SkipList(max_level::Int) = new(max_level, SkipNode(typemin(Int), max_level), 0)
end

function random_level(list::SkipList)
    lvl = 0
    while rand() < 0.5 && lvl < list.max_level
        lvl += 1
    end
    return lvl
end

function insert!(list::SkipList, value::Int)
    update = fill(list.head, list.max_level + 1)
    current = list.head
    for i in list.level:-1:0
        while current.forward[i + 1] !== nothing && current.forward[i + 1].value < value
            current = current.forward[i + 1]
        end
        update[i + 1] = current
    end

    new_level = random_level(list)
    if new_level > list.level
        for i in (list.level + 1):new_level
            update[i + 1] = list.head
        end
        list.level = new_level
    end

    node = SkipNode(value, new_level)
    for i in 0:new_level
        node.forward[i + 1] = update[i + 1].forward[i + 1]
        update[i + 1].forward[i + 1] = node
    end
end

function contains(list::SkipList, value::Int)
    current = list.head
    for i in list.level:-1:0
        while current.forward[i + 1] !== nothing && current.forward[i + 1].value < value
            current = current.forward[i + 1]
        end
    end
    current = current.forward[1]
    return current !== nothing && current.value == value
end

list = SkipList(4)
for v in [3, 6, 7, 9, 12, 19, 17]
    insert!(list, v)
end
println(contains(list, 9))
println(contains(list, 100))

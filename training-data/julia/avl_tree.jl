mutable struct AVLNode
    value::Int
    left::Union{AVLNode, Nothing}
    right::Union{AVLNode, Nothing}
    height::Int
    AVLNode(value::Int) = new(value, nothing, nothing, 1)
end

height(node::Union{AVLNode, Nothing}) = node === nothing ? 0 : node.height

function update_height!(node::AVLNode)
    node.height = 1 + max(height(node.left), height(node.right))
end

balance_factor(node::Union{AVLNode, Nothing}) = node === nothing ? 0 : height(node.left) - height(node.right)

function rotate_right(y::AVLNode)
    x = y.left
    t2 = x.right
    x.right = y
    y.left = t2
    update_height!(y)
    update_height!(x)
    return x
end

function rotate_left(x::AVLNode)
    y = x.right
    t2 = y.left
    y.left = x
    x.right = t2
    update_height!(x)
    update_height!(y)
    return y
end

function insert(node::Union{AVLNode, Nothing}, value::Int)
    if node === nothing
        return AVLNode(value)
    end
    if value < node.value
        node.left = insert(node.left, value)
    elseif value > node.value
        node.right = insert(node.right, value)
    else
        return node
    end

    update_height!(node)
    balance = balance_factor(node)

    if balance > 1 && value < node.left.value
        return rotate_right(node)
    end
    if balance < -1 && value > node.right.value
        return rotate_left(node)
    end
    if balance > 1 && value > node.left.value
        node.left = rotate_left(node.left)
        return rotate_right(node)
    end
    if balance < -1 && value < node.right.value
        node.right = rotate_right(node.right)
        return rotate_left(node)
    end
    return node
end

function inorder(node::Union{AVLNode, Nothing}, result::Vector{Int})
    if node === nothing
        return
    end
    inorder(node.left, result)
    push!(result, node.value)
    inorder(node.right, result)
end

root = nothing
for v in [10, 20, 30, 40, 50, 25]
    global root = insert(root, v)
end
result = Int[]
inorder(root, result)
println(result)
println(root.value)

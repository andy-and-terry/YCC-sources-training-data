mutable struct TreeNode
    value::Int
    left::Union{TreeNode, Nothing}
    right::Union{TreeNode, Nothing}
    TreeNode(v::Int) = new(v, nothing, nothing)
end

function insert(node::Union{TreeNode, Nothing}, value::Int)
    if node === nothing
        return TreeNode(value)
    end
    if value < node.value
        node.left = insert(node.left, value)
    elseif value > node.value
        node.right = insert(node.right, value)
    end
    return node
end

function inorder(node::Union{TreeNode, Nothing}, result::Vector{Int})
    if node === nothing
        return
    end
    inorder(node.left, result)
    push!(result, node.value)
    inorder(node.right, result)
end

root = nothing
for v in [5, 3, 8, 1, 4, 7, 9]
    global root = insert(root, v)
end
result = Int[]
inorder(root, result)
println(result)

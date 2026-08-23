local function insert(node, value)
  if node == nil then
    return { value = value, left = nil, right = nil }
  end
  if value < node.value then
    node.left = insert(node.left, value)
  elseif value > node.value then
    node.right = insert(node.right, value)
  end
  return node
end

local function inorder(node, result)
  if node == nil then return end
  inorder(node.left, result)
  table.insert(result, node.value)
  inorder(node.right, result)
end

local root = nil
for _, v in ipairs({ 5, 3, 8, 1, 4, 7, 9 }) do
  root = insert(root, v)
end
local result = {}
inorder(root, result)
print(table.concat(result, " "))

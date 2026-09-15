local function height(node)
  if node == nil then return 0 end
  return node.height
end

local function update_height(node)
  local left_h = height(node.left)
  local right_h = height(node.right)
  node.height = 1 + math.max(left_h, right_h)
end

local function balance_factor(node)
  if node == nil then return 0 end
  return height(node.left) - height(node.right)
end

local function rotate_right(y)
  local x = y.left
  local t2 = x.right
  x.right = y
  y.left = t2
  update_height(y)
  update_height(x)
  return x
end

local function rotate_left(x)
  local y = x.right
  local t2 = y.left
  y.left = x
  x.right = t2
  update_height(x)
  update_height(y)
  return y
end

local function insert(node, value)
  if node == nil then
    return { value = value, left = nil, right = nil, height = 1 }
  end
  if value < node.value then
    node.left = insert(node.left, value)
  elseif value > node.value then
    node.right = insert(node.right, value)
  else
    return node
  end

  update_height(node)
  local balance = balance_factor(node)

  if balance > 1 and value < node.left.value then
    return rotate_right(node)
  end
  if balance < -1 and value > node.right.value then
    return rotate_left(node)
  end
  if balance > 1 and value > node.left.value then
    node.left = rotate_left(node.left)
    return rotate_right(node)
  end
  if balance < -1 and value < node.right.value then
    node.right = rotate_right(node.right)
    return rotate_left(node)
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
for _, v in ipairs({ 10, 20, 30, 40, 50, 25 }) do
  root = insert(root, v)
end
local result = {}
inorder(root, result)
print(table.concat(result, " "))
print(root.value)

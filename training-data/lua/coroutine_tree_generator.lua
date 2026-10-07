-- Wrapping a recursive in-order traversal in a coroutine turns it into
-- a lazy generator: values come out one at a time instead of all at
-- once, and coroutine.status reveals the generator's lifecycle.
local function insert(node, value)
  if node == nil then
    return { value = value, left = nil, right = nil }
  end
  if value < node.value then
    node.left = insert(node.left, value)
  else
    node.right = insert(node.right, value)
  end
  return node
end

local function inorder_generator(root)
  return coroutine.wrap(function()
    local function visit(node)
      if node == nil then return end
      visit(node.left)
      coroutine.yield(node.value)
      visit(node.right)
    end
    visit(root)
  end)
end

local root = nil
for _, v in ipairs({ 5, 3, 8, 1, 4, 7, 9 }) do
  root = insert(root, v)
end

local co = coroutine.create(function()
  local function visit(node)
    if node == nil then return end
    visit(node.left)
    coroutine.yield(node.value)
    visit(node.right)
  end
  visit(root)
end)

print(coroutine.status(co))
local _, first = coroutine.resume(co)
print("first value:", first)
print(coroutine.status(co))

local values = {}
for value in inorder_generator(root) do
  table.insert(values, value)
end
print(table.concat(values, " "))

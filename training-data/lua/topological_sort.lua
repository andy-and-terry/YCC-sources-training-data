local function visit(node, graph, visited, order)
  if visited[node] then return end
  visited[node] = true
  for _, dep in ipairs(graph[node] or {}) do
    visit(dep, graph, visited, order)
  end
  table.insert(order, node)
end

local function topo_sort(graph)
  local visited = {}
  local order = {}
  for node in pairs(graph) do
    visit(node, graph, visited, order)
  end
  return order
end

local graph = { a = { "b", "c" }, b = { "d" }, c = { "d" }, d = {} }
print(table.concat(topo_sort(graph), " "))

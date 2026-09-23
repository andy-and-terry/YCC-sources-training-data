local function bfs(graph, source)
  local dist = { [source] = 0 }
  local prev = {}
  local queue = { source }
  local first = 1
  local last = 1

  while first <= last do
    local node = queue[first]
    first = first + 1
    for _, neighbor in ipairs(graph[node] or {}) do
      if dist[neighbor] == nil then
        dist[neighbor] = dist[node] + 1
        prev[neighbor] = node
        last = last + 1
        queue[last] = neighbor
      end
    end
  end

  return dist, prev
end

local function path_to(prev, source, target)
  local path = { target }
  local node = target
  while node ~= source do
    node = prev[node]
    if node == nil then return nil end
    table.insert(path, 1, node)
  end
  return path
end

local graph = {
  a = { "b", "c" },
  b = { "a", "d" },
  c = { "a", "d" },
  d = { "b", "c", "e" },
  e = { "d" },
}

local dist, prev = bfs(graph, "a")
for _, node in ipairs({ "a", "b", "c", "d", "e" }) do
  print(node, dist[node])
end

print(table.concat(path_to(prev, "a", "e"), " -> "))

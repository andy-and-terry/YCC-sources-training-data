local function bfs(graph, start)
  local visited = { [start] = true }
  local order = {}
  local queue = { start }
  local head = 1
  while head <= #queue do
    local node = queue[head]
    head = head + 1
    table.insert(order, node)
    for _, neighbor in ipairs(graph[node] or {}) do
      if not visited[neighbor] then
        visited[neighbor] = true
        table.insert(queue, neighbor)
      end
    end
  end
  return order
end

local function dfs(graph, start)
  local visited = {}
  local order = {}
  local function visit(node)
    if visited[node] then return end
    visited[node] = true
    table.insert(order, node)
    for _, neighbor in ipairs(graph[node] or {}) do
      visit(neighbor)
    end
  end
  visit(start)
  return order
end

local graph = {
  a = { "b", "c" },
  b = { "d" },
  c = { "d" },
  d = { "e" },
  e = {}
}

print("bfs: " .. table.concat(bfs(graph, "a"), " "))
print("dfs: " .. table.concat(dfs(graph, "a"), " "))

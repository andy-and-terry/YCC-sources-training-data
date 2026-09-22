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

local graph = {
  [1] = { 2, 3 },
  [2] = { 1, 4 },
  [3] = { 1, 4 },
  [4] = { 2, 3, 5 },
  [5] = { 4 },
}

print(table.concat(bfs(graph, 1), ", "))

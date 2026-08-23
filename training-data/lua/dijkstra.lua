local function dijkstra(graph, source)
  local dist = {}
  for node in pairs(graph) do dist[node] = math.huge end
  dist[source] = 0
  local visited = {}

  for _ = 1, 4 do
    local best_node, best_dist = nil, math.huge
    for node, d in pairs(dist) do
      if not visited[node] and d < best_dist then
        best_node, best_dist = node, d
      end
    end
    if not best_node then break end
    visited[best_node] = true
    for _, edge in ipairs(graph[best_node] or {}) do
      local neighbor, weight = edge[1], edge[2]
      local new_dist = dist[best_node] + weight
      if new_dist < dist[neighbor] then dist[neighbor] = new_dist end
    end
  end
  return dist
end

local graph = {
  a = { { "b", 1 }, { "c", 4 } },
  b = { { "c", 2 }, { "d", 5 } },
  c = { { "d", 1 } },
  d = {}
}
local dist = dijkstra(graph, "a")
for node, d in pairs(dist) do print(node, d) end

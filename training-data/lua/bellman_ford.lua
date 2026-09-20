local function bellman_ford(num_nodes, edges, source)
  local dist = {}
  for i = 0, num_nodes - 1 do dist[i] = math.huge end
  dist[source] = 0

  for _ = 1, num_nodes - 1 do
    for _, edge in ipairs(edges) do
      local u, v, w = edge[1], edge[2], edge[3]
      if dist[u] + w < dist[v] then
        dist[v] = dist[u] + w
      end
    end
  end

  for _, edge in ipairs(edges) do
    local u, v, w = edge[1], edge[2], edge[3]
    if dist[u] + w < dist[v] then
      error("graph contains a negative-weight cycle")
    end
  end

  return dist
end

local edges = {
  { 0, 1, 4 },
  { 0, 2, 5 },
  { 1, 2, -3 },
  { 2, 3, 4 },
}

local dist = bellman_ford(4, edges, 0)
for i = 0, 3 do print(i, dist[i]) end

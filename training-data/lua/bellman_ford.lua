-- Bellman-Ford: single-source shortest paths that tolerates negative
-- edge weights and can detect a negative-weight cycle, unlike dijkstra.
local function bellman_ford(vertices, edges, source)
  local dist = {}
  for _, v in ipairs(vertices) do dist[v] = math.huge end
  dist[source] = 0

  for _ = 1, #vertices - 1 do
    for _, edge in ipairs(edges) do
      local u, v, w = edge[1], edge[2], edge[3]
      if dist[u] + w < dist[v] then
        dist[u] = dist[u]
        dist[v] = dist[u] + w
      end
    end
  end

  local has_negative_cycle = false
  for _, edge in ipairs(edges) do
    local u, v, w = edge[1], edge[2], edge[3]
    if dist[u] + w < dist[v] then
      has_negative_cycle = true
    end
  end

  return dist, has_negative_cycle
end

local vertices = { "a", "b", "c", "d" }
local edges = {
  { "a", "b", 4 },
  { "a", "c", 5 },
  { "b", "c", -3 },
  { "c", "d", 4 },
  { "b", "d", 6 },
}

local dist, has_negative_cycle = bellman_ford(vertices, edges, "a")
for _, v in ipairs(vertices) do
  print(v, dist[v])
end
print("negative cycle:", has_negative_cycle)

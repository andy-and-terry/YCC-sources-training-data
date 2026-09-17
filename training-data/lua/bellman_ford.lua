local function bellman_ford(vertices, edges, source)
  local dist = {}
  for _, v in ipairs(vertices) do dist[v] = math.huge end
  dist[source] = 0

  for _ = 1, #vertices - 1 do
    for _, e in ipairs(edges) do
      local u, v, w = e[1], e[2], e[3]
      if dist[u] ~= math.huge and dist[u] + w < dist[v] then
        dist[v] = dist[u] + w
      end
    end
  end

  local has_negative_cycle = false
  for _, e in ipairs(edges) do
    local u, v, w = e[1], e[2], e[3]
    if dist[u] ~= math.huge and dist[u] + w < dist[v] then
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
  { "b", "d", 6 }
}

local dist, has_cycle = bellman_ford(vertices, edges, "a")
for _, v in ipairs(vertices) do print(v, dist[v]) end
print("negative cycle:", has_cycle)

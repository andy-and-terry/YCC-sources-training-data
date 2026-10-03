local function prim_mst(graph, start, n)
  local visited = {}
  visited[start] = true
  local mst = {}
  local total = 0

  for _ = 1, n - 1 do
    local best_u, best_v, best_w = nil, nil, math.huge
    for u in pairs(visited) do
      for _, edge in ipairs(graph[u] or {}) do
        local v, w = edge[1], edge[2]
        if not visited[v] and w < best_w then
          best_u, best_v, best_w = u, v, w
        end
      end
    end
    if not best_v then break end
    visited[best_v] = true
    table.insert(mst, { best_u, best_v, best_w })
    total = total + best_w
  end
  return mst, total
end

local graph = {
  [1] = { { 2, 2 }, { 4, 6 } },
  [2] = { { 1, 2 }, { 3, 3 }, { 4, 8 }, { 5, 5 } },
  [3] = { { 2, 3 }, { 5, 7 } },
  [4] = { { 1, 6 }, { 2, 8 }, { 5, 9 } },
  [5] = { { 2, 5 }, { 3, 7 }, { 4, 9 } },
}

local mst, total = prim_mst(graph, 1, 5)
for _, edge in ipairs(mst) do
  print(edge[1] .. " - " .. edge[2] .. " : " .. edge[3])
end
print("total weight: " .. total)

local function find(parent, x)
  while parent[x] ~= x do x = parent[x] end
  return x
end

local function union(parent, x, y)
  local root_x, root_y = find(parent, x), find(parent, y)
  if root_x == root_y then return false end
  parent[root_x] = root_y
  return true
end

local function kruskal_mst(n, edges)
  table.sort(edges, function(a, b) return a[3] < b[3] end)
  local parent = {}
  for i = 1, n do parent[i] = i end

  local mst = {}
  local total = 0
  for _, edge in ipairs(edges) do
    local u, v, weight = edge[1], edge[2], edge[3]
    if union(parent, u, v) then
      table.insert(mst, edge)
      total = total + weight
    end
  end
  return mst, total
end

local edges = {
  { 1, 2, 4 }, { 1, 3, 1 }, { 3, 2, 2 },
  { 2, 4, 5 }, { 3, 4, 8 },
}

local mst, total = kruskal_mst(4, edges)
for _, edge in ipairs(mst) do
  print(edge[1] .. " - " .. edge[2] .. " : " .. edge[3])
end
print("total weight: " .. total)

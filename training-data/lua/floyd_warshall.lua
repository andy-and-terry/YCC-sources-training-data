local function floyd_warshall(n, edges)
  local dist = {}
  for i = 1, n do
    dist[i] = {}
    for j = 1, n do
      dist[i][j] = (i == j) and 0 or math.huge
    end
  end

  for _, edge in ipairs(edges) do
    local u, v, w = edge[1], edge[2], edge[3]
    dist[u][v] = w
  end

  for k = 1, n do
    for i = 1, n do
      for j = 1, n do
        if dist[i][k] + dist[k][j] < dist[i][j] then
          dist[i][j] = dist[i][k] + dist[k][j]
        end
      end
    end
  end

  return dist
end

local edges = {
  { 1, 2, 3 },
  { 1, 3, 8 },
  { 1, 5, -4 },
  { 2, 5, 7 },
  { 2, 4, 1 },
  { 3, 2, 4 },
  { 4, 1, 2 },
  { 4, 3, -5 },
  { 5, 4, 6 },
}

local dist = floyd_warshall(5, edges)
for i = 1, 5 do
  local row = {}
  for j = 1, 5 do
    row[j] = tostring(dist[i][j])
  end
  print(table.concat(row, "\t"))
end

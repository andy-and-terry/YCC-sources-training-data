local INF = math.huge

local function floyd_warshall(graph)
  local n = #graph
  local dist = {}
  for i = 1, n do
    dist[i] = {}
    for j = 1, n do
      dist[i][j] = graph[i][j]
    end
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

local graph = {
  { 0,   3,   INF, 7 },
  { 8,   0,   2,   INF },
  { 5,   INF, 0,   1 },
  { 2,   INF, INF, 0 }
}

local dist = floyd_warshall(graph)
for i = 1, #dist do
  print(table.concat(dist[i], " "))
end

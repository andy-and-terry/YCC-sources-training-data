local function is_bipartite(graph, n)
  local colors = {}

  for start = 1, n do
    if colors[start] == nil then
      colors[start] = 0
      local queue = { start }
      while #queue > 0 do
        local node = table.remove(queue, 1)
        for _, neighbor in ipairs(graph[node] or {}) do
          if colors[neighbor] == nil then
            colors[neighbor] = 1 - colors[node]
            table.insert(queue, neighbor)
          elseif colors[neighbor] == colors[node] then
            return false
          end
        end
      end
    end
  end
  return true
end

local bipartite = { [1] = { 2, 4 }, [2] = { 1, 3 }, [3] = { 2, 4 }, [4] = { 1, 3 } }
local not_bipartite = { [1] = { 2, 3 }, [2] = { 1, 3 }, [3] = { 1, 2 } }

print(is_bipartite(bipartite, 4))
print(is_bipartite(not_bipartite, 3))

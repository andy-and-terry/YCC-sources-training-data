local function has_cycle(graph, n)
  local visited = {}
  local in_stack = {}

  local function dfs(node)
    visited[node] = true
    in_stack[node] = true
    for _, neighbor in ipairs(graph[node] or {}) do
      if in_stack[neighbor] then
        return true
      elseif not visited[neighbor] and dfs(neighbor) then
        return true
      end
    end
    in_stack[node] = false
    return false
  end

  for node = 1, n do
    if not visited[node] and dfs(node) then
      return true
    end
  end
  return false
end

local cyclic = { [1] = { 2 }, [2] = { 3 }, [3] = { 1 } }
local acyclic = { [1] = { 2 }, [2] = { 3 }, [3] = {} }

print(has_cycle(cyclic, 3))
print(has_cycle(acyclic, 3))

local function producer()
  return coroutine.create(function()
    for i = 1, 5 do
      coroutine.yield(i * i)
    end
  end)
end

local function consume(prod)
  local results = {}
  while true do
    local ok, value = coroutine.resume(prod)
    if not ok or value == nil then break end
    table.insert(results, value)
  end
  return results
end

local prod = producer()
local results = consume(prod)
print(table.concat(results, " "))

local function is_prime(n)
  if n < 2 then return false end
  for i = 2, math.floor(math.sqrt(n)) do
    if n % i == 0 then return false end
  end
  return true
end

local function cuban()
  local y = 0
  return coroutine.wrap(function()
    while true do
      y = y + 1
      local p = 3 * y * y + 3 * y + 1
      if is_prime(p) then coroutine.yield(p) end
    end
  end)
end

local gen, out = cuban(), {}
for i = 1, 8 do out[i] = gen() end
print(table.concat(out, " "))

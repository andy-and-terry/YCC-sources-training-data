local function pair()
  local n = 0
  return function() n = n + 1; return n end, function() return n end
end

local inc, get = pair()
inc(); inc()
print(get())

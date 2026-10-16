local samples = { 1, 1.5, "s", true, nil, {}, print, coroutine.create(function() end) }
for i = 1, 8 do
  print(i, type(samples[i]), math.type(samples[i]))
end

local function check(v, expected)
  if type(v) ~= expected then
    error(("expected %s, got %s"):format(expected, type(v)), 2)
  end
  return v
end

print(pcall(check, 10, "number"))
print(pcall(check, "x", "number"))

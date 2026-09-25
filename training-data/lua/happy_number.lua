local function step(n)
  local s = 0
  while n > 0 do
    local d = n % 10
    s = s + d * d
    n = n // 10
  end
  return s
end

local function is_happy(n)
  local slow, fast = n, step(n)
  while fast ~= 1 and slow ~= fast do
    slow = step(slow)
    fast = step(step(fast))
  end
  return fast == 1
end

local out = {}
for i = 1, 50 do if is_happy(i) then out[#out + 1] = i end end
print(table.concat(out, " "))

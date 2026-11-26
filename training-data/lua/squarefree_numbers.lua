-- Squarefree numbers up to 100; expect 61.
local function squarefree(n)
  local d = 2
  while d * d <= n do
    if n % (d * d) == 0 then return false end
    d = d + 1
  end
  return true
end
local c = 0
for n = 1, 100 do if squarefree(n) then c = c + 1 end end
print(c)

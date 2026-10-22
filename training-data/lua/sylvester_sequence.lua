-- Sylvester's sequence: s(0) = 2, s(n+1) = s(n)^2 - s(n) + 1
-- Lua 5.3+ integers are 64-bit, so only s(0)..s(6) fit.
local s = 2
for i = 0, 6 do
  print(string.format("s(%d) = %d", i, s))
  s = s * s - s + 1
end

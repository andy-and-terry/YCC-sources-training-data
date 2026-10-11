-- the until condition can see locals declared in the loop body
local n = 0
repeat
  local squared = n * n
  n = n + 1
until squared >= 50
print(n, squared)

local attempts = 0
repeat
  attempts = attempts + 1
  local ok = attempts == 3
until ok
print("succeeded after", attempts)

-- Lua 5.2+ goto/label, useful for breaking out of nested loops and for
-- a simple retry loop that a plain break/continue can't express cleanly.
local grid = {
  { 1, 2, 3 },
  { 4, 5, 6 },
  { 7, 8, 9 },
}

local target = 5
local found_row, found_col = nil, nil

for i = 1, #grid do
  for j = 1, #grid[i] do
    if grid[i][j] == target then
      found_row, found_col = i, j
      goto done
    end
  end
end
::done::
print(string.format("found %d at (%d, %d)", target, found_row, found_col))

local attempts = 0
::retry::
attempts = attempts + 1
if attempts < 3 then
  goto retry
end
print("attempts:", attempts)

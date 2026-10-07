-- Lua 5.2+ 'goto' is most commonly used to simulate a 'continue'
-- statement, which the language otherwise lacks.
local function sum_of_non_multiples(n, divisor)
  local total = 0
  for i = 1, n do
    if i % divisor == 0 then
      goto continue
    end
    total = total + i
    ::continue::
  end
  return total
end

print(sum_of_non_multiples(10, 3))

-- goto can also jump forward out of nested loops in one step. Note that
-- 'return' must be the last statement in its block, so an early-exit
-- flag (rather than 'return' right before the label) is used here.
local function contains_value(matrix, target)
  local found = false
  for i = 1, #matrix do
    for j = 1, #matrix[i] do
      if matrix[i][j] == target then
        found = true
        goto done
      end
    end
  end
  ::done::
  return found
end

print(contains_value({ { 1, 2 }, { 3, 4 } }, 3))
print(contains_value({ { 1, 2 }, { 3, 4 } }, 9))

local function is_safe(queens, col)
  for i, q in ipairs(queens) do
    local dist = #queens - i + 1
    if q == col or math.abs(q - col) == dist then return false end
  end
  return true
end

local function solve(queens, n)
  if #queens == n then return 1 end
  local count = 0
  for col = 0, n - 1 do
    if is_safe(queens, col) then
      local new_queens = {}
      for i, v in ipairs(queens) do new_queens[i] = v end
      table.insert(new_queens, col)
      count = count + solve(new_queens, n)
    end
  end
  return count
end

print(solve({}, 6))

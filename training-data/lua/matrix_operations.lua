local function transpose(matrix)
  local result = {}
  for c = 1, #matrix[1] do
    result[c] = {}
    for r = 1, #matrix do
      result[c][r] = matrix[r][c]
    end
  end
  return result
end

local function multiply(a, b)
  local bt = transpose(b)
  local result = {}
  for i, row in ipairs(a) do
    result[i] = {}
    for j, col in ipairs(bt) do
      local sum = 0
      for k = 1, #row do sum = sum + row[k] * col[k] end
      result[i][j] = sum
    end
  end
  return result
end

local a = { { 1, 2 }, { 3, 4 } }
local b = { { 5, 6 }, { 7, 8 } }
local product = multiply(a, b)
for _, row in ipairs(product) do print(table.concat(row, " ")) end

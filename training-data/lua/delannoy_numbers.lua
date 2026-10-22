local function delannoy(size)
  local d = {}
  for m = 0, size - 1 do
    d[m] = {}
    for n = 0, size - 1 do
      if m == 0 or n == 0 then
        d[m][n] = 1
      else
        d[m][n] = d[m - 1][n] + d[m][n - 1] + d[m - 1][n - 1]
      end
    end
  end
  return d
end

local table_d = delannoy(10)
local central = {}
for i = 0, 9 do
  central[#central + 1] = table_d[i][i]
end
print(table.concat(central, " "))

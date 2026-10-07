local function pascal(n)
  local rows = {}
  for i = 1, n do
    local row = { 1 }
    for j = 2, i - 1 do
      row[j] = rows[i - 1][j - 1] + rows[i - 1][j]
    end
    if i > 1 then row[i] = 1 end
    rows[i] = row
  end
  return rows
end

for _, row in ipairs(pascal(6)) do
  print(table.concat(row, " "))
end

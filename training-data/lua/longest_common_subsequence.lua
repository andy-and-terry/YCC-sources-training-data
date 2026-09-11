local function lcs(a, b)
  local m, n = #a, #b
  local table2d = {}
  for i = 0, m do
    table2d[i] = {}
    for j = 0, n do
      table2d[i][j] = 0
    end
  end

  for i = 1, m do
    for j = 1, n do
      if a:sub(i, i) == b:sub(j, j) then
        table2d[i][j] = table2d[i - 1][j - 1] + 1
      else
        table2d[i][j] = math.max(table2d[i - 1][j], table2d[i][j - 1])
      end
    end
  end

  local result = {}
  local i, j = m, n
  while i > 0 and j > 0 do
    if a:sub(i, i) == b:sub(j, j) then
      table.insert(result, 1, a:sub(i, i))
      i = i - 1
      j = j - 1
    elseif table2d[i - 1][j] >= table2d[i][j - 1] then
      i = i - 1
    else
      j = j - 1
    end
  end
  return table.concat(result)
end

print(lcs("ABCBDAB", "BDCABA"))
print(#lcs("abcde", "ace"))

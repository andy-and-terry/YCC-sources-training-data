local function is_valid_isbn10(isbn)
  local s = isbn:gsub("-", "")
  if not s:match("^%d%d%d%d%d%d%d%d%d[%dX]$") then return false end
  local total = 0
  for i = 1, 10 do
    local c = s:sub(i, i)
    local v = c == "X" and 10 or tonumber(c)
    total = total + v * (11 - i)
  end
  return total % 11 == 0
end

for _, s in ipairs({ "3-598-21508-8", "3-598-21507-X", "3-598-21508-9" }) do
  print(s, is_valid_isbn10(s))
end

local function column_title(n)
  local out = ""
  while n > 0 do
    n = n - 1
    out = string.char(65 + n % 26) .. out
    n = n // 26
  end
  return out
end

print(column_title(28), column_title(701)) -- AB  ZY

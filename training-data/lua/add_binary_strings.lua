local function add_binary(a, b)
  local i, j, carry, out = #a, #b, 0, {}
  while i >= 1 or j >= 1 or carry > 0 do
    local sum = carry
    if i >= 1 then sum = sum + tonumber(a:sub(i, i)); i = i - 1 end
    if j >= 1 then sum = sum + tonumber(b:sub(j, j)); j = j - 1 end
    table.insert(out, 1, sum % 2)
    carry = sum // 2
  end
  return table.concat(out)
end

print(add_binary("1010", "1011")) -- 10101

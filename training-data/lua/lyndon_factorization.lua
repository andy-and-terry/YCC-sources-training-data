local function duval(s)
  local out, i, n = {}, 1, #s
  while i <= n do
    local j, k = i + 1, i
    while j <= n and s:sub(k, k) <= s:sub(j, j) do
      k = (s:sub(k, k) < s:sub(j, j)) and i or k + 1
      j = j + 1
    end
    while i <= k do
      out[#out + 1] = s:sub(i, i + j - k - 1)
      i = i + j - k
    end
  end
  return out
end

print(table.concat(duval("banana"), " "))

local function farey(n)
  local terms = { "0/1" }
  local a, b, c, d = 0, 1, 1, n
  while c <= n do
    terms[#terms + 1] = c .. "/" .. d
    local k = (n + b) // d
    a, b, c, d = c, d, k * c - a, k * d - b
  end
  return terms
end

print(table.concat(farey(5), " "))

local function golomb(count)
  local g = { 1 }
  for n = 2, count do
    g[n] = 1 + g[n - g[g[n - 1]]]
  end
  return g
end

print(table.concat(golomb(20), " "))

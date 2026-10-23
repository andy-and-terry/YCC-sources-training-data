local function van_eck(count)
  local seq = { 0 }
  local last_seen = {}
  for n = 0, count - 2 do
    local current = seq[n + 1]
    local nxt = 0
    if last_seen[current] then
      nxt = n - last_seen[current]
    end
    last_seen[current] = n
    seq[n + 2] = nxt
  end
  return seq
end

print(table.concat(van_eck(20), " "))

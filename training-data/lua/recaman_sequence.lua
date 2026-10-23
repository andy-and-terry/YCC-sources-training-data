local function recaman(count)
  local seq = { 0 }
  local seen = { [0] = true }
  for n = 1, count - 1 do
    local nxt = seq[n] - n
    if nxt <= 0 or seen[nxt] then
      nxt = seq[n] + n
    end
    seen[nxt] = true
    seq[n + 1] = nxt
  end
  return seq
end

print(table.concat(recaman(20), " "))

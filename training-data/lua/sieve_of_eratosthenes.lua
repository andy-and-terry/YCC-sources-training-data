local function sieve(limit)
  local is_composite = {}
  local primes = {}
  for i = 2, math.floor(math.sqrt(limit)) do
    if not is_composite[i] then
      for j = i * i, limit, i do
        is_composite[j] = true
      end
    end
  end
  for i = 2, limit do
    if not is_composite[i] then table.insert(primes, i) end
  end
  return primes
end

print(table.concat(sieve(50), " "))

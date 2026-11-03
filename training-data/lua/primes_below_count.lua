local function count_primes_below(n)
  if n < 3 then return 0 end
  local composite, count = {}, 0
  for i = 2, n - 1 do
    if not composite[i] then
      count = count + 1
      for j = i * i, n - 1, i do composite[j] = true end
    end
  end
  return count
end

print(count_primes_below(100))

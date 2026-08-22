local function isPrime(n)
  if n < 2 then return false end
  for i = 2, math.floor(math.sqrt(n)) do
    if n % i == 0 then return false end
  end
  return true
end

local primes = {}
for n = 2, 20 do
  if isPrime(n) then table.insert(primes, n) end
end
print(table.concat(primes, " "))

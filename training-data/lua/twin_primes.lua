-- Twin primes below 50 via sieve.
local s = {}
for i = 0, 52 do s[i] = i >= 2 end
for i = 2, 7 do if s[i] then for j = i * i, 52, i do s[j] = false end end end
for p = 2, 50 do if s[p] and s[p + 2] then io.write("(", p, ",", p + 2, ") ") end end
print()

-- Jacobsthal numbers: J0=0, J1=1, Jn = J(n-1) + 2*J(n-2)
local a, b = 0, 1
local terms = {}
for _ = 1, 15 do
  terms[#terms + 1] = a
  a, b = b, b + 2 * a
end
print(table.concat(terms, " "))

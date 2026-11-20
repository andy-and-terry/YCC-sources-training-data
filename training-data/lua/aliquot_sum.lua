-- Aliquot sum classification.
local function aliquot(n)
  local s = 0
  for d = 1, n - 1 do if n % d == 0 then s = s + d end end
  return s
end
for _, n in ipairs({6, 12, 15, 28}) do
  local a = aliquot(n)
  print(n, a, a == n and "perfect" or a > n and "abundant" or "deficient")
end

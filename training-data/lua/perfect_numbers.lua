local function aliquot_sum(n)
  if n == 1 then return 0 end
  local sum, i = 1, 2
  while i * i <= n do
    if n % i == 0 then
      sum = sum + i
      if i ~= n // i then sum = sum + n // i end
    end
    i = i + 1
  end
  return sum
end

local function classify(n)
  local s = aliquot_sum(n)
  if s == n then return "perfect" elseif s > n then return "abundant" else return "deficient" end
end

for _, n in ipairs({ 6, 12, 28, 13, 8128 }) do print(n, classify(n)) end

-- Repunits: R_n = 11...1 (n ones), built as R_{n-1}*10 + 1.
local r = 0
for _ = 1, 8 do
  r = r * 10 + 1
  print(r .. (r % 3 == 0 and "  (divisible by 3)" or ""))
end

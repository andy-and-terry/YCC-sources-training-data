# Repunits: R_n = 11...1 (n ones), built as R_{n-1}*10 + 1.
r = 0_i64
(1..8).each do
  r = r * 10 + 1
  puts "#{r}#{r % 3 == 0 ? "  (divisible by 3)" : ""}"
end

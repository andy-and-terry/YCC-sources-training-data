s = ~c"abcabc"
k = 3
hash = fn chars -> Enum.reduce(chars, 0, fn c, h -> rem(h * 31 + c, 1_000_003) end) end

for i <- 0..(length(s) - k) do
  IO.puts("#{i} #{hash.(Enum.slice(s, i, k))}")
end

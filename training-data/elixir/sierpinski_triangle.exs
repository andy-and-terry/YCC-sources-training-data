import Bitwise

n = 8

for r <- 0..(n - 1) do
  row = for c <- 0..r, into: "", do: if(band(r, c) == c, do: "* ", else: "  ")
  IO.puts(String.duplicate(" ", n - r - 1) <> row)
end

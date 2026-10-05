import Bitwise

value = 0b10110100

IO.puts(Integer.to_string(value, 2))
IO.puts("and: #{Integer.to_string(value &&& 0b1111, 2)}")
IO.puts("or: #{Integer.to_string(value ||| 0b1, 2)}")
IO.puts("xor: #{Integer.to_string(bxor(value, 0b11111111), 2)}")
IO.puts("not: #{bnot(value)}")
IO.puts("shift left: #{value <<< 2}")
IO.puts("shift right: #{value >>> 4}")

pop_count = fn n ->
  n |> Integer.digits(2) |> Enum.count(&(&1 == 1))
end

IO.puts("pop count: #{pop_count.(value)}")
IO.puts("power of two? #{(64 &&& 63) == 0}")
IO.puts("bit 2 set? #{(value &&& (1 <<< 2)) != 0}")

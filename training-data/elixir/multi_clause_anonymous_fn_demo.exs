classify = fn
  0 -> "zero"
  n when is_integer(n) and n < 0 -> "negative"
  n when is_integer(n) and rem(n, 2) == 0 -> "even"
  n when is_integer(n) -> "odd"
  _ -> "not an integer"
end

Enum.each([0, -4, 8, 7, 2.5, :x], fn v ->
  IO.puts("#{inspect(v)} -> #{classify.(v)}")
end)

area = fn
  {:circle, r} -> 3.14159 * r * r
  {:rect, w, h} -> w * h
  {:square, s} -> s * s
end

IO.inspect(area.({:circle, 2}))
IO.inspect(area.({:rect, 3, 4}))
IO.inspect(area.({:square, 5}))

adder = fn a -> fn b -> a + b end end
IO.inspect(adder.(3).(4))
IO.inspect(Enum.map([1, 2, 3], &adder.(10).(&1)))

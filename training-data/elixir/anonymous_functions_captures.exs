add = fn a, b -> a + b end
inc = &(&1 + 1)
mul = &*/2
IO.inspect({add.(1, 2), inc.(5), mul.(3, 4)})
compose = fn f, g -> fn x -> g.(f.(x)) end end
IO.inspect(compose.(inc, &(&1 * 10)).(1))
make_counter = fn start -> fn -> start + 1 end end
IO.inspect(make_counter.(10).())
IO.inspect(Enum.map([1, 2, 3], &Integer.to_string/1))
IO.inspect((fn {a, b} -> a * b end).({6, 7}))
sq = fn
  0 -> :zero
  n when n < 0 -> :neg
  n -> n * n
end
IO.inspect(Enum.map([0, -2, 3], sq))
IO.inspect(is_function(add, 2))

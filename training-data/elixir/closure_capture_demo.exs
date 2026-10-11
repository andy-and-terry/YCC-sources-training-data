make_adder = fn n -> fn x -> x + n end end
add5 = make_adder.(5)
IO.inspect(add5.(10))

x = 10
f = fn -> x * 2 end
x = 99
IO.inspect(f.())
IO.inspect(x)

counter =
  Enum.map(1..3, fn i -> fn -> i * i end end)

IO.inspect(Enum.map(counter, & &1.()))
IO.inspect(is_function(add5, 1))

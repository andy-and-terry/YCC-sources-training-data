defmodule Util do
  def double(x), do: x * 2
  def add(a, b), do: a + b
end

IO.inspect(Enum.map([1, 2, 3], &Util.double/1))
IO.inspect(Enum.reduce([1, 2, 3], 0, &Util.add/2))
IO.inspect(Enum.map(["a", "b"], &String.upcase/1))

square = &(&1 * &1)
IO.inspect(square.(7))

pair = &{&1, &2}
IO.inspect(pair.(:k, :v))

wrap = &"<#{&1}>"
IO.inspect(wrap.("tag"))

compose = fn f, g -> fn x -> g.(f.(x)) end end
inc_then_double = compose.(&(&1 + 1), &Util.double/1)
IO.inspect(inc_then_double.(4))

IO.inspect(is_function(&Util.add/2, 2))
IO.inspect(Enum.map([[1, 2], [3]], &length/1))
IO.inspect(apply(&Util.add/2, [10, 5]))
IO.inspect((&Kernel.+/2).(2, 3))

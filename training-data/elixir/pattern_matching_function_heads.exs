defmodule Shapes do
  def area({:circle, r}), do: 3.14159 * r * r
  def area({:rect, w, h}), do: w * h
  def area({:square, s}), do: area({:rect, s, s})
  def area(_), do: {:error, :unknown}
end

IO.inspect(Shapes.area({:circle, 2}))
IO.inspect(Shapes.area({:square, 3}))
IO.inspect(Shapes.area(:blob))
[head | tail] = [1, 2, 3]
%{name: name, age: age} = %{name: "Ada", age: 36, extra: true}
IO.inspect({head, tail, name, age})
{:ok, value} = {:ok, 42}
^value = 42
IO.inspect(value)

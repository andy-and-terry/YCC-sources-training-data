defmodule Secant do
  def solve(f, x0, x1, n \\ 50)
  def solve(_f, _x0, x1, 0), do: x1

  def solve(f, x0, x1, n) do
    {f0, f1} = {f.(x0), f.(x1)}

    if f1 == f0 do
      x1
    else
      next = x1 - f1 * (x1 - x0) / (f1 - f0)
      if abs(next - x1) < 1.0e-12, do: next, else: solve(f, x1, next, n - 1)
    end
  end
end

IO.puts(Secant.solve(fn x -> x * x - 2 end, 1.0, 2.0))

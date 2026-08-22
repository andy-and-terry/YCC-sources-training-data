defmodule Prime do
  def prime?(n) when n < 2, do: false

  def prime?(n) do
    2..trunc(:math.sqrt(n))
    |> Enum.all?(fn i -> rem(n, i) != 0 end)
  end
end

IO.inspect(Enum.filter(2..20, &Prime.prime?/1))

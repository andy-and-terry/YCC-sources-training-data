defmodule Armstrong do
  def armstrong?(n) do
    digits = Integer.digits(n)
    len = length(digits)
    Enum.sum(Enum.map(digits, &Integer.pow(&1, len))) == n
  end
end

1..999 |> Enum.filter(&Armstrong.armstrong?/1) |> IO.inspect(limit: :infinity)
# [1..9, 153, 370, 371, 407]

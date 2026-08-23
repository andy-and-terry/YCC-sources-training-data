defmodule Armstrong do
  def armstrong?(n) do
    digits = Integer.digits(n)
    power = length(digits)
    Enum.reduce(digits, 0, fn d, acc -> acc + Integer.pow(d, power) end) == n
  end
end

IO.inspect(Armstrong.armstrong?(153))
IO.inspect(Armstrong.armstrong?(154))

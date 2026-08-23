defmodule LeapYear do
  def leap?(year) do
    rem(year, 4) == 0 and (rem(year, 100) != 0 or rem(year, 400) == 0)
  end
end

IO.inspect(LeapYear.leap?(2000))
IO.inspect(LeapYear.leap?(1900))
IO.inspect(LeapYear.leap?(2024))

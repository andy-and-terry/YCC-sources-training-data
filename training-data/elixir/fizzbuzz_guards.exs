defmodule FizzBuzzGuards do
  def call(n) when rem(n, 15) == 0, do: "FizzBuzz"
  def call(n) when rem(n, 3) == 0, do: "Fizz"
  def call(n) when rem(n, 5) == 0, do: "Buzz"
  def call(n), do: Integer.to_string(n)
end

1..20
|> Enum.map(&FizzBuzzGuards.call/1)
|> IO.inspect()

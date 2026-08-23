defmodule Pipelines do
  def run do
    result =
      1..20
      |> Enum.filter(&(rem(&1, 2) == 0))
      |> Enum.map(&(&1 * &1))
      |> Enum.reduce(0, &+/2)

    IO.inspect(result)

    words = ~w(the quick brown fox jumps)
    longest = Enum.max_by(words, &String.length/1)
    IO.inspect(longest)
  end
end

Pipelines.run()

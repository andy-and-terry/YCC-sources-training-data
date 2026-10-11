defmodule Parser do
  def parse_age(str) do
    case Integer.parse(str) do
      {n, ""} when n >= 0 -> {:ok, n}
      {_, ""} -> {:error, :negative}
      _ -> {:error, :not_a_number}
    end
  end
end

for input <- ["30", "-4", "abc", "12x"] do
  IO.inspect({input, Parser.parse_age(input)})
end

{:ok, v} = Parser.parse_age("7")
IO.inspect(v)

IO.inspect(Enum.map(["1", "x"], fn s -> with {:ok, n} <- Parser.parse_age(s), do: n * 2 end))

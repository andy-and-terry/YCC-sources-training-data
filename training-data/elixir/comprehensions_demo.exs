defmodule Comprehensions do
  def run do
    squares = for n <- 1..10, do: n * n
    evens_squared = for n <- 1..10, rem(n, 2) == 0, do: n * n
    pairs = for x <- 1..3, y <- 1..3, x != y, do: {x, y}
    matrix = for row <- [[1, 2], [3, 4]], into: [], do: Enum.sum(row)

    IO.inspect(squares)
    IO.inspect(evens_squared)
    IO.inspect(pairs)
    IO.inspect(matrix)
  end
end

Comprehensions.run()

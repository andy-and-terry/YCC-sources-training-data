defmodule Pascal do
  def rows(n) do
    Stream.iterate([1], fn row ->
      Enum.zip_with([[0 | row], row ++ [0]], fn [a, b] -> a + b end)
    end)
    |> Enum.take(n)
  end
end

Pascal.rows(6)
|> Enum.each(fn row -> IO.puts(Enum.join(row, " ")) end)

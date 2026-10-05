defmodule Pascal do
  def rows(n) do
    Enum.take(Stream.iterate([1], &next_row/1), n)
  end

  defp next_row(row) do
    Enum.zip_with([0 | row], row ++ [0], &+/2)
  end
end

Pascal.rows(6)
|> Enum.each(fn row -> IO.puts(Enum.join(row, " ")) end)

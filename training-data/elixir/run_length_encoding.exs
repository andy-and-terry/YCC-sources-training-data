defmodule RunLengthEncoding do
  def encode(""), do: ""

  def encode(input) do
    input
    |> String.graphemes()
    |> Enum.chunk_by(& &1)
    |> Enum.map(fn chunk -> "#{hd(chunk)}#{length(chunk)}" end)
    |> Enum.join()
  end
end

IO.puts(RunLengthEncoding.encode("aaabbbcca"))

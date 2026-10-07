defmodule LookAndSay do
  def next(s) do
    s
    |> String.graphemes()
    |> Enum.chunk_by(& &1)
    |> Enum.map_join(fn run -> "#{length(run)}#{hd(run)}" end)
  end

  def stream, do: Stream.iterate("1", &next/1)
end

LookAndSay.stream() |> Enum.take(8) |> Enum.each(&IO.puts/1)

defmodule EnumStreamDemo do
  def run do
    lazy =
      Stream.iterate(1, &(&1 + 1))
      |> Stream.map(&(&1 * &1))
      |> Stream.take_while(&(&1 < 50))
      |> Enum.to_list()

    IO.inspect(lazy)

    grouped = Enum.group_by(1..10, &rem(&1, 3))
    IO.inspect(grouped)

    chunked = Enum.chunk_every(1..10, 3)
    IO.inspect(chunked)
  end
end

EnumStreamDemo.run()

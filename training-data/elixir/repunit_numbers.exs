# Repunits: numbers made only of the digit 1.
repunits = Stream.iterate(1, &(&1 * 10 + 1)) |> Enum.take(5)
IO.inspect(repunits)

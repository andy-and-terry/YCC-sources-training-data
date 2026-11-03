triangular = Stream.scan(Stream.iterate(1, &(&1 + 1)), &+/2)

IO.inspect(Enum.take(triangular, 10))

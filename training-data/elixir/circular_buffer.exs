defmodule CircularBuffer do
  defstruct data: %{}, size: 0, capacity: 0, start: 0

  def new(capacity), do: %CircularBuffer{capacity: capacity}

  def push(%CircularBuffer{data: data, size: size, capacity: capacity, start: start} = buf, value) do
    index = rem(start + size, capacity)

    if size < capacity do
      %{buf | data: Map.put(data, index, value), size: size + 1}
    else
      %{buf | data: Map.put(data, index, value), start: rem(start + 1, capacity)}
    end
  end

  def to_list(%CircularBuffer{data: data, size: size, capacity: capacity, start: start}) do
    for i <- 0..(size - 1), do: Map.get(data, rem(start + i, capacity))
  end
end

buf = CircularBuffer.new(3)
buf = Enum.reduce([1, 2, 3, 4, 5], buf, &CircularBuffer.push(&2, &1))
IO.inspect(CircularBuffer.to_list(buf))

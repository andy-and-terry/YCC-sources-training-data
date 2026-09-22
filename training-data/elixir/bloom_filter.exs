defmodule BloomFilter do
  defstruct bits: %{}, size: 0, hash_count: 0

  def new(size, hash_count) do
    %__MODULE__{bits: %{}, size: size, hash_count: hash_count}
  end

  def add(%__MODULE__{} = filter, item) do
    bits =
      Enum.reduce(0..(filter.hash_count - 1), filter.bits, fn seed, acc ->
        Map.put(acc, hash(item, seed, filter.size), true)
      end)

    %{filter | bits: bits}
  end

  def maybe_contains?(%__MODULE__{} = filter, item) do
    Enum.all?(0..(filter.hash_count - 1), fn seed ->
      Map.get(filter.bits, hash(item, seed, filter.size), false)
    end)
  end

  defp hash(item, seed, size) do
    item
    |> to_charlist()
    |> Enum.reduce(seed, fn byte, acc -> rem(acc * 31 + byte, 1_000_000_007) end)
    |> rem(size)
  end
end

filter =
  BloomFilter.new(64, 3)
  |> BloomFilter.add("apple")
  |> BloomFilter.add("banana")

IO.inspect(BloomFilter.maybe_contains?(filter, "apple"))
IO.inspect(BloomFilter.maybe_contains?(filter, "banana"))
IO.inspect(BloomFilter.maybe_contains?(filter, "cherry"))

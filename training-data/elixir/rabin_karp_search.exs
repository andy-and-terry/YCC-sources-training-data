defmodule RabinKarp do
  @base 256
  @modulus 101

  # Finds all starting indices where `pattern` occurs in `text`, using a
  # rolling hash as a cheap pre-filter before confirming an exact match.
  def search(text, pattern) do
    n = String.length(text)
    m = String.length(pattern)

    if m > n do
      []
    else
      pattern_hash = pattern |> String.to_charlist() |> hash()

      Enum.filter(0..(n - m), fn start ->
        window = String.slice(text, start, m)
        hash(String.to_charlist(window)) == pattern_hash and window == pattern
      end)
    end
  end

  defp hash(chars), do: Enum.reduce(chars, 0, fn c, acc -> rem(acc * @base + c, @modulus) end)
end

IO.inspect(RabinKarp.search("abracadabra", "abra"))
IO.inspect(RabinKarp.search("aaaaa", "aa"))
IO.inspect(RabinKarp.search("hello", "xyz"))

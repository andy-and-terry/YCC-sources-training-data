defmodule RabinKarp do
  @base 256
  @modulus 1_000_000_007

  def search(text, pattern) do
    n = String.length(text)
    m = String.length(pattern)

    if m == 0 or m > n do
      -1
    else
      text_codes = String.to_charlist(text)
      pattern_codes = String.to_charlist(pattern)

      pattern_hash = hash(pattern_codes)
      high_order = pow(@base, m - 1)

      text
      |> String.to_charlist()
      |> Enum.take(m)
      |> hash()
      |> then(&try_match(text_codes, pattern_codes, pattern_hash, &1, high_order, n, m, 0))
    end
  end

  defp try_match(_text, _pattern, _phash, _hash, _high, n, m, i) when i > n - m, do: -1

  defp try_match(text, pattern, phash, hash, high, n, m, i) do
    if hash == phash and Enum.slice(text, i, m) == pattern do
      i
    else
      if i == n - m do
        -1
      else
        old_char = Enum.at(text, i)
        new_char = Enum.at(text, i + m)
        next_hash = roll(hash, old_char, new_char, high)
        try_match(text, pattern, phash, next_hash, high, n, m, i + 1)
      end
    end
  end

  defp roll(hash, old_char, new_char, high) do
    Integer.mod((hash - old_char * high) * @base + new_char, @modulus)
  end

  defp hash(codes) do
    Enum.reduce(codes, 0, fn c, acc -> rem(acc * @base + c, @modulus) end)
  end

  defp pow(base, exp), do: pow(base, exp, 1)
  defp pow(_base, 0, acc), do: acc
  defp pow(base, exp, acc), do: pow(base, exp - 1, rem(acc * base, @modulus))
end

IO.inspect(RabinKarp.search("abxabcabcaby", "abcaby"))
IO.inspect(RabinKarp.search("hello world", "world"))
IO.inspect(RabinKarp.search("hello world", "xyz"))

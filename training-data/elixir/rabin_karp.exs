defmodule RabinKarp do
  @base 256
  @modulus 1_000_000_007

  def search(text, pattern) do
    n = String.length(text)
    m = String.length(pattern)

    if m == 0 or m > n do
      []
    else
      text_chars = String.to_charlist(text)
      pattern_chars = String.to_charlist(pattern)

      pattern_hash = hash(pattern_chars)
      high_order = pow_mod(@base, m - 1, @modulus)

      window = Enum.take(text_chars, m)
      window_hash = hash(window)

      text_chars
      |> scan(pattern_chars, window, window_hash, pattern_hash, high_order, m, n, 0, [])
      |> Enum.reverse()
    end
  end

  defp hash(chars) do
    Enum.reduce(chars, 0, fn c, acc -> Integer.mod(acc * @base + c, @modulus) end)
  end

  defp pow_mod(_base, 0, _modulus), do: 1

  defp pow_mod(base, exp, modulus) do
    Integer.mod(base * pow_mod(base, exp - 1, modulus), modulus)
  end

  defp scan(text_chars, pattern_chars, window, window_hash, pattern_hash, high_order, m, n, i, matches) do
    matches =
      if window_hash == pattern_hash and window == pattern_chars do
        [i | matches]
      else
        matches
      end

    if i < n - m do
      old_char = Enum.at(text_chars, i)
      new_char = Enum.at(text_chars, i + m)
      new_window = tl(window) ++ [new_char]

      new_hash = Integer.mod((window_hash - old_char * high_order) * @base + new_char, @modulus)

      scan(text_chars, pattern_chars, new_window, new_hash, pattern_hash, high_order, m, n, i + 1, matches)
    else
      matches
    end
  end
end

IO.inspect(RabinKarp.search("abracadabra", "abra"))
IO.inspect(RabinKarp.search("aaaaaa", "aa"))
IO.inspect(RabinKarp.search("hello", "xyz"))

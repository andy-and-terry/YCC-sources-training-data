defmodule Caesar do
  def encode(text, shift) do
    text
    |> String.to_charlist()
    |> Enum.map(&rotate(&1, shift))
    |> List.to_string()
  end

  defp rotate(c, k) when c in ?a..?z, do: Integer.mod(c - ?a + k, 26) + ?a
  defp rotate(c, k) when c in ?A..?Z, do: Integer.mod(c - ?A + k, 26) + ?A
  defp rotate(c, _), do: c
end

enc = Caesar.encode("Hello, World!", 3)
IO.puts(enc)
IO.puts(Caesar.encode(enc, -3))

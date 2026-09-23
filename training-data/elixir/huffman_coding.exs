defmodule HuffmanCoding do
  defmodule Node do
    defstruct [:char, :freq, :left, :right]
  end

  def build_tree(frequencies) do
    frequencies
    |> Enum.map(fn {char, freq} -> %Node{char: char, freq: freq} end)
    |> merge_until_one()
  end

  defp merge_until_one([tree]), do: tree

  defp merge_until_one(nodes) do
    [first, second | rest] = Enum.sort_by(nodes, & &1.freq)
    merged = %Node{freq: first.freq + second.freq, left: first, right: second}
    merge_until_one([merged | rest])
  end

  def build_codes(tree), do: collect_codes(tree, "", %{})

  defp collect_codes(%Node{char: char, left: nil, right: nil}, prefix, acc) do
    Map.put(acc, char, if(prefix == "", do: "0", else: prefix))
  end

  defp collect_codes(%Node{left: left, right: right}, prefix, acc) do
    acc
    |> then(&collect_codes(left, prefix <> "0", &1))
    |> then(&collect_codes(right, prefix <> "1", &1))
  end

  def encode(codes, text) do
    text
    |> String.graphemes()
    |> Enum.map(&Map.fetch!(codes, &1))
    |> Enum.join()
  end
end

frequencies = [{"a", 5}, {"b", 9}, {"c", 12}, {"d", 13}, {"e", 16}, {"f", 45}]

tree = HuffmanCoding.build_tree(frequencies)
codes = HuffmanCoding.build_codes(tree)

IO.inspect(codes)
IO.inspect(HuffmanCoding.encode(codes, "face"))

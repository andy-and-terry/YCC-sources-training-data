defmodule BinaryTreeDiameter do
  defmodule Node do
    defstruct [:value, :left, :right]
  end

  def diameter(nil), do: 0

  def diameter(node) do
    {diam, _height} = diameter_and_height(node)
    diam
  end

  defp diameter_and_height(nil), do: {0, 0}

  defp diameter_and_height(%Node{left: left, right: right}) do
    {left_diam, left_height} = diameter_and_height(left)
    {right_diam, right_height} = diameter_and_height(right)

    through_root = left_height + right_height
    best = Enum.max([left_diam, right_diam, through_root])

    {best, max(left_height, right_height) + 1}
  end
end

alias BinaryTreeDiameter.Node

tree = %Node{
  value: 1,
  left: %Node{value: 2, left: %Node{value: 4}, right: %Node{value: 5}},
  right: %Node{value: 3}
}

IO.puts(BinaryTreeDiameter.diameter(tree))

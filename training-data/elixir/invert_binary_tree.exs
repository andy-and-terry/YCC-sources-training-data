defmodule InvertBinaryTree do
  defmodule Node do
    defstruct [:value, :left, :right]
  end

  def invert(nil), do: nil

  def invert(%Node{value: value, left: left, right: right}) do
    %Node{value: value, left: invert(right), right: invert(left)}
  end

  def inorder(nil), do: []

  def inorder(%Node{value: value, left: left, right: right}) do
    inorder(left) ++ [value] ++ inorder(right)
  end
end

alias InvertBinaryTree.Node

tree = %Node{
  value: 4,
  left: %Node{value: 2, left: %Node{value: 1}, right: %Node{value: 3}},
  right: %Node{value: 7}
}

inverted = InvertBinaryTree.invert(tree)
IO.inspect(InvertBinaryTree.inorder(inverted))

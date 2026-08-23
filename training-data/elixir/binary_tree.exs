defmodule BinaryTree do
  defstruct value: nil, left: nil, right: nil

  def insert(nil, value), do: %BinaryTree{value: value}

  def insert(%BinaryTree{value: v, left: l, right: r} = node, value) do
    cond do
      value < v -> %BinaryTree{node | left: insert(l, value)}
      value > v -> %BinaryTree{node | right: insert(r, value)}
      true -> node
    end
  end

  def inorder(nil), do: []

  def inorder(%BinaryTree{value: v, left: l, right: r}) do
    inorder(l) ++ [v] ++ inorder(r)
  end
end

tree = Enum.reduce([5, 3, 8, 1, 4, 7, 9], nil, &BinaryTree.insert(&2, &1))
IO.inspect(BinaryTree.inorder(tree))

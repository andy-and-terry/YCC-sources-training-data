defmodule AVLTree do
  defstruct value: nil, left: nil, right: nil, height: 1

  def insert(nil, value), do: %AVLTree{value: value}

  def insert(%AVLTree{value: v, left: l, right: r} = node, value) do
    cond do
      value < v -> rebalance(%AVLTree{node | left: insert(l, value)})
      value > v -> rebalance(%AVLTree{node | right: insert(r, value)})
      true -> node
    end
  end

  def inorder(nil), do: []

  def inorder(%AVLTree{value: v, left: l, right: r}) do
    inorder(l) ++ [v] ++ inorder(r)
  end

  defp rebalance(node) do
    node = %{node | height: 1 + max(height(node.left), height(node.right))}
    balance = height(node.left) - height(node.right)

    cond do
      balance > 1 and height(node.left.left) >= height(node.left.right) ->
        rotate_right(node)

      balance > 1 ->
        rotate_right(%{node | left: rotate_left(node.left)})

      balance < -1 and height(node.right.right) >= height(node.right.left) ->
        rotate_left(node)

      balance < -1 ->
        rotate_left(%{node | right: rotate_right(node.right)})

      true ->
        node
    end
  end

  defp rotate_left(node) do
    new_root = node.right
    node = %{node | right: new_root.left}
    node = %{node | height: 1 + max(height(node.left), height(node.right))}
    new_root = %{new_root | left: node}
    %{new_root | height: 1 + max(height(new_root.left), height(new_root.right))}
  end

  defp rotate_right(node) do
    new_root = node.left
    node = %{node | left: new_root.right}
    node = %{node | height: 1 + max(height(node.left), height(node.right))}
    new_root = %{new_root | right: node}
    %{new_root | height: 1 + max(height(new_root.left), height(new_root.right))}
  end

  defp height(nil), do: 0
  defp height(%AVLTree{height: h}), do: h
end

tree = Enum.reduce([9, 5, 10, 0, 6, 11, -1, 1, 2], nil, &AVLTree.insert(&2, &1))
IO.inspect(AVLTree.inorder(tree))

defmodule AVLTree do
  defstruct value: nil, left: nil, right: nil, height: 1

  def height(nil), do: 0
  def height(%AVLTree{height: h}), do: h

  def balance_factor(nil), do: 0
  def balance_factor(%AVLTree{left: l, right: r}), do: height(l) - height(r)

  def insert(nil, value), do: %AVLTree{value: value}

  def insert(%AVLTree{value: v, left: l, right: r} = node, value) do
    cond do
      value < v -> rebalance(%AVLTree{node | left: insert(l, value)})
      value > v -> rebalance(%AVLTree{node | right: insert(r, value)})
      true -> node
    end
  end

  defp rebalance(%AVLTree{left: l, right: r} = node) do
    node = %AVLTree{node | height: 1 + max(height(l), height(r))}
    balance = balance_factor(node)

    cond do
      balance > 1 && balance_factor(l) >= 0 ->
        rotate_right(node)

      balance > 1 ->
        rotate_right(%AVLTree{node | left: rotate_left(l)})

      balance < -1 && balance_factor(r) <= 0 ->
        rotate_left(node)

      balance < -1 ->
        rotate_left(%AVLTree{node | right: rotate_right(r)})

      true ->
        node
    end
  end

  defp rotate_right(%AVLTree{left: l} = y) do
    new_y = update_height(%AVLTree{y | left: l.right})
    update_height(%AVLTree{l | right: new_y})
  end

  defp rotate_left(%AVLTree{right: r} = x) do
    new_x = update_height(%AVLTree{x | right: r.left})
    update_height(%AVLTree{r | left: new_x})
  end

  defp update_height(%AVLTree{left: l, right: r} = node) do
    %AVLTree{node | height: 1 + max(height(l), height(r))}
  end

  def inorder(nil), do: []

  def inorder(%AVLTree{value: v, left: l, right: r}) do
    inorder(l) ++ [v] ++ inorder(r)
  end
end

tree = Enum.reduce([10, 20, 30, 40, 50, 25], nil, &AVLTree.insert(&2, &1))
IO.inspect(AVLTree.inorder(tree))
IO.inspect(AVLTree.height(tree))

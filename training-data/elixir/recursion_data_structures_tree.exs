defmodule BST do
  def insert(nil, v), do: {nil, v, nil}
  def insert({l, x, r}, v) when v < x, do: {insert(l, v), x, r}
  def insert({l, x, r}, v) when v > x, do: {l, x, insert(r, v)}
  def insert(t, _), do: t

  def to_list(nil), do: []
  def to_list({l, x, r}), do: to_list(l) ++ [x] ++ to_list(r)

  def height(nil), do: 0
  def height({l, _, r}), do: 1 + max(height(l), height(r))

  def member?(nil, _), do: false
  def member?({l, x, r}, v), do: cond do
    v < x -> member?(l, v)
    v > x -> member?(r, v)
    true -> true
  end
end

t = Enum.reduce([5, 3, 8, 1, 4, 9], nil, &BST.insert(&2, &1))
IO.inspect({BST.to_list(t), BST.height(t), BST.member?(t, 4), BST.member?(t, 7)})

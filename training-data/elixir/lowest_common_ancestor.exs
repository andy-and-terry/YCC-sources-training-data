defmodule LowestCommonAncestor do
  defmodule Node do
    defstruct [:value, :left, :right]
  end

  def find(nil, _p, _q), do: nil

  def find(%Node{value: v} = node, p, q) when v == p or v == q, do: node

  def find(%Node{left: left, right: right}, p, q) do
    left_result = find(left, p, q)
    right_result = find(right, p, q)

    cond do
      left_result != nil and right_result != nil -> %Node{value: :ancestor}
      left_result != nil -> left_result
      true -> right_result
    end
  end
end

alias LowestCommonAncestor.Node

tree = %Node{
  value: 6,
  left: %Node{value: 2, left: %Node{value: 0}, right: %Node{value: 4}},
  right: %Node{value: 8}
}

result = LowestCommonAncestor.find(tree, 0, 4)
IO.inspect(result)

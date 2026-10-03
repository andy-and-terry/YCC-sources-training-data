defmodule PermutationsBacktracking do
  def permute([]), do: [[]]

  def permute(list) do
    for elem <- list,
        rest <- permute(List.delete(list, elem)) do
      [elem | rest]
    end
  end
end

IO.inspect(PermutationsBacktracking.permute([1, 2, 3]))

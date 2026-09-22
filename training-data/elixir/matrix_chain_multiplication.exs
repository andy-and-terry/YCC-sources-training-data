defmodule MatrixChainMultiplication do
  # dims has n+1 entries for n matrices, where matrix i (1-indexed) has
  # dimensions dims[i-1] x dims[i]. Returns the minimum number of scalar
  # multiplications needed to compute the full chain product.
  def min_cost(dims) do
    n = length(dims) - 1
    dims = List.to_tuple(dims)
    base = for i <- 1..n, into: %{}, do: {{i, i}, 0}

    table =
      Enum.reduce(2..n, base, fn chain_len, acc ->
        Enum.reduce(1..(n - chain_len + 1), acc, fn i, acc2 ->
          j = i + chain_len - 1

          best =
            Enum.reduce(i..(j - 1), nil, fn k, best_so_far ->
              candidate =
                Map.fetch!(acc2, {i, k}) + Map.fetch!(acc2, {k + 1, j}) +
                  elem(dims, i - 1) * elem(dims, k) * elem(dims, j)

              if best_so_far == nil or candidate < best_so_far, do: candidate, else: best_so_far
            end)

          Map.put(acc2, {i, j}, best)
        end)
      end)

    Map.get(table, {1, n}, 0)
  end
end

# Matrices of sizes 10x20, 20x30, 30x40, 40x30
IO.inspect(MatrixChainMultiplication.min_cost([10, 20, 30, 40, 30]))

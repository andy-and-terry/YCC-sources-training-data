defmodule ReservoirSampling do
  def sample(stream, k) do
    stream
    |> Enum.with_index()
    |> Enum.reduce([], fn {item, index}, reservoir ->
      cond do
        index < k ->
          reservoir ++ [item]

        true ->
          j = :rand.uniform(index + 1) - 1

          if j < k do
            List.replace_at(reservoir, j, item)
          else
            reservoir
          end
      end
    end)
  end
end

:rand.seed(:exsss, {1, 2, 3})
IO.inspect(ReservoirSampling.sample(1..20, 5))

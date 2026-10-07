defmodule ZAlgorithm do
  def z_array(s) do
    chars = String.graphemes(s) |> List.to_tuple()
    n = tuple_size(chars)
    z = :array.new(n, default: 0)

    {z, _l, _r} =
      Enum.reduce(1..(n - 1), {z, 0, 0}, fn i, {z, l, r} ->
        z_i = if i < r, do: min(r - i, :array.get(i - l, z)), else: 0
        {z_i, new_r} = expand(chars, n, i, z_i)

        {l, r} = if i + z_i > r, do: {i, i + z_i}, else: {l, r}
        {:array.set(i, z_i, z), l, r}
      end)

    :array.to_list(z)
  end

  defp expand(chars, n, i, z_i) do
    if i + z_i < n and elem(chars, z_i) == elem(chars, i + z_i) do
      expand(chars, n, i, z_i + 1)
    else
      {z_i, i + z_i}
    end
  end
end

IO.inspect(ZAlgorithm.z_array("aabxaabxcaabxaabxay"))

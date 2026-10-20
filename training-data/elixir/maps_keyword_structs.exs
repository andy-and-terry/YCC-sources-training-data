defmodule User do
  defstruct name: "anon", age: 0, roles: []
end

u = %User{name: "Ada", age: 36}
u2 = %{u | age: 37, roles: [:admin]}
IO.inspect(u2)
IO.inspect(Map.from_struct(u2))
m = %{"a" => 1, b: 2}
IO.inspect({m["a"], m[:b], Map.get(m, :zzz, :none), Map.keys(m)})
kw = [timeout: 100, retries: 3]
IO.inspect({kw[:timeout], Keyword.get(kw, :x, 0), Keyword.put(kw, :retries, 5)})
IO.inspect(Map.merge(%{a: 1, b: 2}, %{b: 3}, fn _k, v1, v2 -> v1 + v2 end))
IO.inspect(get_in(%{a: %{b: %{c: 1}}}, [:a, :b, :c]))
IO.inspect(put_in(%{a: %{b: 1}}, [:a, :b], 2))
IO.inspect(update_in(%{n: [1, 2]}, [:n], &Enum.map(&1, fn x -> x * 2 end)))

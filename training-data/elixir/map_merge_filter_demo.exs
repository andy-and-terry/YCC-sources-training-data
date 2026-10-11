a = %{x: 1, y: 2}
b = %{y: 20, z: 30}

IO.inspect(Map.merge(a, b))
IO.inspect(Map.merge(a, b, fn _k, v1, v2 -> v1 + v2 end))
IO.inspect(Map.take(b, [:z]))
IO.inspect(Map.drop(b, [:z]))
IO.inspect(Map.filter(Map.merge(a, b), fn {_k, v} -> v > 10 end))
IO.inspect(Map.new([a: 1, b: 2], fn {k, v} -> {to_string(k), v * 2} end))
IO.inspect(Map.pop(a, :x))

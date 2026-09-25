defmodule Rotation do
  def rotation?(a, b), do: byte_size(a) == byte_size(b) and String.contains?(a <> a, b)
end

IO.inspect(Rotation.rotation?("waterbottle", "erbottlewat"))
IO.inspect(Rotation.rotation?("abc", "acb"))

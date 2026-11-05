defmodule User do
  @enforce_keys [:name]
  defstruct [:name, age: 0]
end

u = %User{name: "Ann"}
u2 = %{u | age: 31}
IO.inspect(u2)
IO.inspect(Map.from_struct(u2))

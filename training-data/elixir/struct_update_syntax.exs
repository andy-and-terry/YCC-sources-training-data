defmodule User do
  defstruct name: "", age: 0
end

u = %User{name: "Ann", age: 30}
u2 = %{u | age: 31}
IO.inspect(u2)

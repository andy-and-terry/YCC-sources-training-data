defmodule Account do
  defstruct owner: nil, balance: 0, active: true
end

a = %Account{owner: "Zoe"}
b = %{a | balance: 100}
IO.inspect(b)

%Account{balance: bal} = b
IO.inspect(bal)

IO.inspect(match?(%Account{active: true}, b))
IO.inspect(Map.get(b, :owner))
IO.inspect(is_map(b))
IO.inspect(b.__struct__)
IO.inspect(struct(Account, owner: "Yan", balance: 5))

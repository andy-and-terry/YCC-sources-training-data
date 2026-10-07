defmodule User do
  @enforce_keys [:name, :email]
  defstruct [:name, :email, role: :member, active: true]

  def new(name, email, opts \\ []) do
    struct!(__MODULE__, [name: name, email: email] ++ opts)
  end

  def promote(%__MODULE__{} = user), do: %{user | role: :admin}
end

u = User.new("Ann", "ann@example.com")
IO.inspect(u)
IO.inspect(User.promote(u))

try do
  struct!(User, name: "Bob")
rescue
  e in ArgumentError -> IO.puts("error: #{Exception.message(e)}")
end

IO.inspect(Map.from_struct(u))
IO.inspect(match?(%User{role: :member}, u))

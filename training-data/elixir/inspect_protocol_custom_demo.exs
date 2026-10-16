defmodule Secret do
  defstruct [:user, :password]

  defimpl Inspect do
    def inspect(%{user: user}, _opts), do: "#Secret<user: #{user}, password: ***>"
  end
end

s = %Secret{user: "root", password: "hunter2"}
IO.inspect(s)
IO.puts(inspect(s))
IO.inspect(Map.from_struct(s))

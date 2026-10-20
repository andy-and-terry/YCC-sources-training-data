defmodule MyError do
  defexception message: "custom failure", code: 0
end

try do
  raise MyError, code: 7
rescue
  e in MyError -> IO.puts("caught #{e.message} code=#{e.code}")
after
  IO.puts("cleanup")
end

try do
  1 / 0
rescue
  ArithmeticError -> IO.puts("arith")
end

try do
  throw(:early)
catch
  :early -> IO.puts("thrown")
end

IO.inspect(try do: exit(:boom), catch: (:exit, r -> {:exited, r}))
result = try do: String.to_integer("zz"), rescue: (ArgumentError -> :bad)
IO.inspect(result)

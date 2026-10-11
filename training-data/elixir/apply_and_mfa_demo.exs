IO.inspect(apply(String, :upcase, ["abc"]))
IO.inspect(apply(&Kernel.+/2, [3, 4]))

mfa = {Enum, :reverse, [[1, 2, 3]]}
{m, f, a} = mfa
IO.inspect(apply(m, f, a))

IO.inspect(function_exported?(Enum, :map, 2))
IO.inspect(Kernel.function_exported?(String, :nope, 1))
fun = Function.capture(String, :length, 1)
IO.inspect(fun.("four"))
IO.inspect(Function.info(fun, :arity))

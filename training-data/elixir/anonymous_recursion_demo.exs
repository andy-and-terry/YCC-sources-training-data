fact = fn
  f, 0 -> 1
  f, n -> n * f.(f, n - 1)
end

IO.inspect(fact.(fact, 6))

fib = fn fib_fn, n ->
  if n < 2, do: n, else: fib_fn.(fib_fn, n - 1) + fib_fn.(fib_fn, n - 2)
end

IO.inspect(Enum.map(0..10, &fib.(fib, &1)))

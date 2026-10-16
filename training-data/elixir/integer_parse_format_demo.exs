require Integer

IO.inspect(Integer.parse("42abc"))
IO.inspect(Integer.parse("abc"))
IO.inspect(Integer.parse("ff", 16))
IO.inspect(String.to_integer("-17"))
IO.inspect(Integer.to_string(255, 2))
IO.inspect(Integer.digits(9051))
IO.inspect(Integer.undigits([1, 2, 3]))
IO.inspect(Float.parse("3.5e2x"))
IO.inspect(Integer.gcd(48, 18))
IO.inspect(Integer.is_even(4))

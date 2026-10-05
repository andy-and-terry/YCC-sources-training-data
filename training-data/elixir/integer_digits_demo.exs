n = 12345

IO.inspect(Integer.digits(n))
IO.inspect(Integer.digits(255, 2))
IO.inspect(Integer.undigits([1, 2, 3]))
IO.inspect(Integer.digits(n) |> Enum.sum())
IO.inspect(Integer.pow(2, 20))
IO.inspect(Integer.gcd(48, 18))
IO.inspect(Integer.mod(-7, 3))
IO.inspect(rem(-7, 3))
IO.inspect(Integer.floor_div(-7, 2))
IO.inspect(div(-7, 2))
IO.inspect(Integer.to_string(255, 16))
IO.inspect(String.to_integer("ff", 16))

is_palindrome? = fn x -> Integer.digits(x) == x |> Integer.digits() |> Enum.reverse() end
IO.inspect(Enum.filter(100..130, is_palindrome?))

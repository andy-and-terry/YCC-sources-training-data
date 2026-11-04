for b <- [2, 8, 16, 36] do
  IO.puts("255 in base #{b} = #{Integer.to_string(255, b) |> String.downcase()}")
end

IO.inspect(String.to_integer("zz", 36))
IO.inspect(Integer.parse("9", 8))  # :error
IO.inspect(Integer.digits(255, 16))

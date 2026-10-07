charlist = ~c"hello"
binary = "hello"

IO.inspect(charlist)
IO.inspect(binary)
IO.inspect(charlist == binary)
IO.inspect(List.to_string(charlist) == binary)
IO.inspect(String.to_charlist(binary))
IO.inspect(is_list(charlist))
IO.inspect(is_binary(binary))
IO.inspect(byte_size("héllo"))
IO.inspect(String.length("héllo"))
IO.inspect(:binary.bin_to_list("abc"))
IO.inspect(?a)
IO.inspect(<<104, 105>>)
IO.inspect(<<104, 105, 0>>, binaries: :as_binaries)
IO.inspect(Enum.map(~c"abc", &(&1 - 32)) |> List.to_string())
IO.inspect(String.codepoints("añb"))

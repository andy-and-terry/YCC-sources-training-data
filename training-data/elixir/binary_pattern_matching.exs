<<a, b, rest::binary>> = "hello"
IO.inspect({a, b, rest})
<<r::8, g::8, b2::8>> = <<255, 128, 0>>
IO.inspect({r, g, b2})
<<n::16>> = <<1, 2>>
IO.inspect(n)
IO.inspect(for <<c <- "abc">>, do: c + 1)
IO.inspect(<<65, 66>> == "AB")
IO.inspect(byte_size("héllo"))
IO.inspect(String.length("héllo"))
IO.inspect(:binary.bin_to_list("ab"))
IO.inspect(String.graphemes("ab") ++ String.codepoints("é"))

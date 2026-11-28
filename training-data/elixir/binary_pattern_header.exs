<<ver::4, len::4, rest::binary>> = <<0x25, "abc">>
IO.inspect({ver, len, rest})

bin = <<1::size(4), 10::size(4), 255>>
IO.inspect(bin)
IO.inspect(bit_size(bin))
IO.inspect(byte_size(bin))

<<hi::4, lo::4, rest::binary>> = bin
IO.inspect({hi, lo, rest})

<<r::8, g::8, b::8>> = <<255, 128, 0>>
IO.inspect({r, g, b})

IO.inspect(<<"abc"::binary, 100>>)
IO.inspect(<<1::16>>)
IO.inspect(<<1::little-16>>)

<<a, b, rest::binary>> = "ABCDEF"
IO.inspect({a, b, rest})

<<version::8, len::16, payload::binary-size(2), _::binary>> = <<1, 0, 2, 104, 105, 99>>
IO.inspect({version, len, payload})

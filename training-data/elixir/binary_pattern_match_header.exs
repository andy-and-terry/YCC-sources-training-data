<<version::8, len::16, payload::binary-size(3), rest::binary>> =
  <<1, 0, 3, "abcXYZ">>

IO.inspect({version, len, payload, rest})

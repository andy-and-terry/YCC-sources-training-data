fun step c =
  if Word.andb (c, 0wx80) <> 0w0
  then Word.andb (Word.xorb (Word.<< (c, 0w1), 0wx07), 0wxFF)
  else Word.andb (Word.<< (c, 0w1), 0wxFF)

fun byte (b, crc) =
  let fun go (0, c) = c | go (n, c) = go (n - 1, step c)
  in go (8, Word.xorb (crc, b)) end

fun crc8 s = foldl byte 0w0 (map (Word.fromInt o Char.ord) (String.explode s))

val () = print (Word.fmt StringCvt.HEX (crc8 "123456789") ^ "\n")

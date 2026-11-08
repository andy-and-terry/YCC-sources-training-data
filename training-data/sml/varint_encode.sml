fun varint n =
  if n < 128 then [n]
  else (n mod 128 + 128) :: varint (n div 128)

val () = print (String.concatWith " " (map Int.toString (varint 300)) ^ "\n")

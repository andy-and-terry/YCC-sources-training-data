fun rot47c c =
  let val n = Char.ord c
  in if n >= 33 andalso n <= 126 then Char.chr (33 + (n - 33 + 47) mod 94) else c end

val rot47 = String.map rot47c

val e = rot47 "Hello, World!"
val () = print (e ^ "\n" ^ rot47 e ^ "\n")

fun encode [] = []
  | encode (x :: xs) =
      let
        fun count (y, n, []) = [(y, n)]
          | count (y, n, z :: zs) =
              if z = y then count (y, n + 1, zs) else (y, n) :: encode (z :: zs)
      in
        count (x, 1, xs)
      end

fun decode [] = []
  | decode ((c, n) :: rest) = List.tabulate (n, fn _ => c) @ decode rest

val encoded = encode (String.explode "aaabbbcca")
val () = print (String.concat (map (fn (c, n) => Char.toString c ^ Int.toString n) encoded) ^ "\n")
val decoded = decode encoded
val () = print (String.implode decoded ^ "\n")

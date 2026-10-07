(* Reflected binary Gray code *)
fun gray n = Word.xorb (n, Word.>> (n, 0w1))

fun toBin w =
  if w = 0w0 then "0"
  else
    let
      fun go 0w0 acc = acc
        | go x acc = go (Word.>> (x, 0w1)) ((if Word.andb (x, 0w1) = 0w1 then "1" else "0") ^ acc)
    in go w "" end

fun pad k s = if size s >= k then s else pad k ("0" ^ s)

val () = List.app (fn i =>
  print (Int.toString i ^ ": " ^ pad 3 (toBin (gray (Word.fromInt i))) ^ "\n"))
  [0, 1, 2, 3, 4, 5, 6, 7]

fun gray n = Word.xorb (n, Word.>> (n, 0w1))

fun decode g =
  let
    fun loop (n, 0w0) = n
      | loop (n, s) = loop (Word.xorb (n, s), Word.>> (s, 0w1))
  in
    loop (0w0, g)
  end

fun toBits w =
  StringCvt.padLeft #"0" 3 (Word.fmt StringCvt.BIN w)

val () =
  List.app
    (fn i =>
      let val g = gray (Word.fromInt i)
      in print (toBits g ^ " -> " ^ Int.toString (Word.toInt (decode g)) ^ "\n") end)
    [0, 1, 2, 3, 4, 5, 6, 7]

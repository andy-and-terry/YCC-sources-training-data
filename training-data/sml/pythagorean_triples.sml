fun triples n =
  let
    fun range (a, b) = if a > b then [] else a :: range (a + 1, b)
    val rs = range (1, n)
  in
    List.concat (map (fn a =>
      List.concat (map (fn b =>
        List.mapPartial (fn c =>
          if a < b andalso a * a + b * b = c * c then SOME (a, b, c) else NONE) rs) rs)) rs)
  end

val () = List.app (fn (a, b, c) =>
  print (Int.toString a ^ "," ^ Int.toString b ^ "," ^ Int.toString c ^ "\n")) (triples 20)

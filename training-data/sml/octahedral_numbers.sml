(* n(2n^2+1)/3 *)
fun term n = (n * (((2 * n) * n) + 1)) div 3

val () =
  List.app
    (fn n => print (Int.toString n ^ " -> " ^ Int.toString (term n) ^ "\n"))
    (List.tabulate (15, fn i => i + 1))

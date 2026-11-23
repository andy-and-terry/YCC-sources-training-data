(* 3n(n-1)+1 *)
fun term n = ((3 * n) * (n - 1)) + 1

val () =
  List.app
    (fn n => print (Int.toString n ^ " -> " ^ Int.toString (term n) ^ "\n"))
    (List.tabulate (15, fn i => i + 1))

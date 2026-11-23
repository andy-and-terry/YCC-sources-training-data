(* n(n+1)(n+2)/6 *)
fun term n = ((n * (n + 1)) * (n + 2)) div 6

val () =
  List.app
    (fn n => print (Int.toString n ^ " -> " ^ Int.toString (term n) ^ "\n"))
    (List.tabulate (15, fn i => i + 1))

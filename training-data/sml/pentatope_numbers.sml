(* n(n+1)(n+2)(n+3)/24 *)
fun term n = (((n * (n + 1)) * (n + 2)) * (n + 3)) div 24

val () =
  List.app
    (fn n => print (Int.toString n ^ " -> " ^ Int.toString (term n) ^ "\n"))
    (List.tabulate (15, fn i => i + 1))

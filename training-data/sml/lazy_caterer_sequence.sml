(* n(n+1)/2+1 *)
fun term n = ((n * (n + 1)) div 2) + 1

val () =
  List.app
    (fn n => print (Int.toString n ^ " -> " ^ Int.toString (term n) ^ "\n"))
    (List.tabulate (15, fn i => i + 1))

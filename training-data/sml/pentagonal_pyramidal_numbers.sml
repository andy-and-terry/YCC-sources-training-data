(* n^2(n+1)/2 *)
fun term n = ((n * n) * (n + 1)) div 2

val () =
  List.app
    (fn n => print (Int.toString n ^ " -> " ^ Int.toString (term n) ^ "\n"))
    (List.tabulate (15, fn i => i + 1))

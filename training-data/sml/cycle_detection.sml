(* Cycle detection in a directed graph via 3-color DFS
   (White = unvisited, Gray = on the current path, Black = finished). *)

datatype color = White | Gray | Black

fun has_cycle graph =
  let
    val colors = ref (map (fn (n, _) => (n, White)) graph)
    fun getColor n = case List.find (fn (k, _) => k = n) (!colors) of SOME (_, c) => c | NONE => White
    fun setColor (n, c) = colors := (n, c) :: List.filter (fn (k, _) => k <> n) (!colors)
    fun neighbors n = case List.find (fn (k, _) => k = n) graph of SOME (_, ns) => ns | NONE => []
    fun visit n =
      case getColor n of
        Gray => true
      | Black => false
      | White =>
          (setColor (n, Gray);
           let val cyc = List.exists visit (neighbors n) in
             setColor (n, Black);
             cyc
           end)
  in
    List.exists (fn (n, _) => visit n) graph
  end

val acyclic = [("a", ["b"]), ("b", ["c"]), ("c", [])]
val cyclic  = [("a", ["b"]), ("b", ["c"]), ("c", ["a"])]

val () = print (Bool.toString (has_cycle acyclic) ^ "\n")
val () = print (Bool.toString (has_cycle cyclic) ^ "\n")

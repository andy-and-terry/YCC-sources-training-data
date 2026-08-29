fun visit (node, graph, visited, order) =
  if List.exists (fn n => n = node) (!visited) then ()
  else
    (visited := node :: !visited;
     app (fn dep => visit (dep, graph, visited, order)) (case List.find (fn (n, _) => n = node) graph of SOME (_, deps) => deps | NONE => []);
     order := node :: !order)

fun topo_sort graph =
  let
    val visited = ref []
    val order = ref []
  in
    app (fn (node, _) => visit (node, graph, visited, order)) graph;
    !order
  end

val graph = [("a", ["b", "c"]), ("b", ["d"]), ("c", ["d"]), ("d", [])]
val () = print (String.concatWith " " (topo_sort graph) ^ "\n")

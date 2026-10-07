fun neighbors (graph, node) =
  case List.find (fn (n, _) => n = node) graph of
    SOME (_, ns) => ns
  | NONE => []

fun dfs (graph, start) =
  let
    val visited = ref []
    fun visit node =
      if List.exists (fn v => v = node) (!visited) then ()
      else
        (visited := !visited @ [node];
         app visit (neighbors (graph, node)))
  in
    visit start;
    !visited
  end

val graph = [(1, [2, 3]), (2, [1, 4]), (3, [1, 4]), (4, [2, 3, 5]), (5, [4])]

val () = print (String.concatWith " " (map Int.toString (dfs (graph, 1))) ^ "\n")
val () = print (String.concatWith " " (map Int.toString (dfs (graph, 5))) ^ "\n")

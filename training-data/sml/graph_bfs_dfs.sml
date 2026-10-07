fun neighbors (graph, node) =
  case List.find (fn (n, _) => n = node) graph of
    SOME (_, adj) => adj
  | NONE => []

fun dfs (graph, start) =
  let
    val visited = ref []
    fun visit node =
      if List.exists (fn n => n = node) (!visited) then ()
      else
        (visited := !visited @ [node];
         app visit (neighbors (graph, node)))
  in
    visit start;
    !visited
  end

fun bfs (graph, start) =
  let
    val visited = ref [start]
    fun loop [] = []
      | loop (node :: rest) =
          let
            val unvisited =
              List.filter (fn n => not (List.exists (fn v => v = n) (!visited)))
                (neighbors (graph, node))
          in
            visited := !visited @ unvisited;
            node :: loop (rest @ unvisited)
          end
  in
    loop [start]
  end

val graph = [("a", ["b", "c"]), ("b", ["d"]), ("c", ["d", "e"]), ("d", ["e"]), ("e", [])]
val () = print (String.concatWith " " (dfs (graph, "a")) ^ "\n")
val () = print (String.concatWith " " (bfs (graph, "a")) ^ "\n")

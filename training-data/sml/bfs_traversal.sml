fun neighbors (graph, node) =
  case List.find (fn (n, _) => n = node) graph of
    SOME (_, ns) => ns
  | NONE => []

fun bfs (graph, start) =
  let
    fun loop (queue, visited, order) =
      case queue of
        [] => rev order
      | node :: rest =>
          let
            val nexts = List.filter (fn n => not (List.exists (fn v => v = n) visited)) (neighbors (graph, node))
          in
            loop (rest @ nexts, visited @ nexts, node :: order)
          end
  in
    loop ([start], [start], [])
  end

val graph = [(1, [2, 3]), (2, [1, 4]), (3, [1, 4]), (4, [2, 3, 5]), (5, [4])]

val () = print (String.concatWith " " (map Int.toString (bfs (graph, 1))) ^ "\n")
val () = print (String.concatWith " " (map Int.toString (bfs (graph, 5))) ^ "\n")

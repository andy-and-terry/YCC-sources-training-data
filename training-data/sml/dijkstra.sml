fun dijkstra (graph, source) =
  let
    val dist = ref (map (fn (n, _) => (n, 999999)) graph)
    val () = dist := (source, 0) :: List.filter (fn (n, _) => n <> source) (!dist)
    val visited = ref []
    fun getDist n = case List.find (fn (k, _) => k = n) (!dist) of SOME (_, d) => d | NONE => 999999
    fun setDist (n, d) = dist := (n, d) :: List.filter (fn (k, _) => k <> n) (!dist)
    fun step () =
      let
        val unvisited = List.filter (fn (n, _) => not (List.exists (fn v => v = n) (!visited))) (!dist)
      in
        case unvisited of
          [] => ()
        | _ =>
            let
              val (bestNode, bestDist) = foldl (fn (a, b) => if #2 a < #2 b then a else b) (hd unvisited) unvisited
              val () = visited := bestNode :: !visited
              val edges = case List.find (fn (n, _) => n = bestNode) graph of SOME (_, e) => e | NONE => []
              val () = app (fn (neighbor, weight) =>
                          let val newDist = bestDist + weight in
                            if newDist < getDist neighbor then setDist (neighbor, newDist) else ()
                          end) edges
            in
              step ()
            end
      end
    val () = step ()
  in
    !dist
  end

val graph = [("a", [("b", 1), ("c", 4)]), ("b", [("c", 2), ("d", 5)]), ("c", [("d", 1)]), ("d", [])]
val results = dijkstra (graph, "a")
val () = app (fn (n, d) => print (n ^ ": " ^ Int.toString d ^ "\n")) results

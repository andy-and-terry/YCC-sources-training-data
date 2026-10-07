(* Bellman-Ford shortest paths from a source, tolerant of negative edge
   weights and able to detect a negative-weight cycle. The graph is an
   adjacency list: (node, (neighbor, weight) list) list. *)

fun bellman_ford (graph, source) =
  let
    val nodes = map #1 graph
    val dist = ref (map (fn n => (n, if n = source then 0 else 999999)) nodes)
    fun getDist n = case List.find (fn (k, _) => k = n) (!dist) of SOME (_, d) => d | NONE => 999999
    fun setDist (n, d) = dist := (n, d) :: List.filter (fn (k, _) => k <> n) (!dist)
    fun edges () =
      List.concat (map (fn (u, es) => map (fn (v, w) => (u, v, w)) es) graph)
    fun relaxOnce () =
      foldl (fn ((u, v, w), changed) =>
               let val du = getDist u in
                 if du <> 999999 andalso du + w < getDist v
                 then (setDist (v, du + w); true)
                 else changed
               end) false (edges ())
    fun loop 0 = ()
      | loop n = if relaxOnce () then loop (n - 1) else ()
    val () = loop (List.length nodes - 1)
    val hasNegativeCycle = relaxOnce ()
  in
    (!dist, hasNegativeCycle)
  end

val graph = [("a", [("b", 4), ("c", 1)]), ("b", [("d", 1)]), ("c", [("b", ~2), ("d", 5)]), ("d", [])]
val (dist, neg) = bellman_ford (graph, "a")
val () = app (fn (n, d) => print (n ^ ": " ^ Int.toString d ^ "\n")) dist
val () = print ("negative cycle: " ^ Bool.toString neg ^ "\n")

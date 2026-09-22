fun bellman_ford (graph, source) =
  let
    val nodes = map #1 graph
    val edges = List.concat (map (fn (u, adj) => map (fn (v, w) => (u, v, w)) adj) graph)
    val dist = ref (map (fn n => (n, if n = source then 0 else 1000000)) nodes)
    fun getDist n = case List.find (fn (k, _) => k = n) (!dist) of SOME (_, d) => d | NONE => 1000000
    fun setDist (n, d) = dist := (n, d) :: List.filter (fn (k, _) => k <> n) (!dist)
    fun relaxOnce () =
      app (fn (u, v, w) =>
             let val du = getDist u in
               if du <> 1000000 andalso du + w < getDist v then setDist (v, du + w) else ()
             end) edges
    val numNodes = length nodes
    fun relaxN 0 = ()
      | relaxN k = (relaxOnce (); relaxN (k - 1))
  in
    relaxN (numNodes - 1);
    !dist
  end

val graph = [("a", [("b", 4), ("c", 1)]), ("b", [("d", 1)]), ("c", [("b", ~2), ("d", 5)]), ("d", [])]
val results = bellman_ford (graph, "a")
val () = app (fn (n, d) => print (n ^ ": " ^ Int.toString d ^ "\n")) results

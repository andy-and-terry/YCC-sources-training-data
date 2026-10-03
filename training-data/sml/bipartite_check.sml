(* Checks whether an undirected graph is bipartite via BFS 2-coloring.
   color 0 = unvisited, 1/2 = the two colors; a node is only ever
   enqueued once, right when it gets colored. *)
fun is_bipartite (adj, n) =
  let
    val color = Array.array (n, 0)

    fun bfs start =
      let
        fun go [] = true
          | go (v :: rest) =
              let
                val vcolor = Array.sub (color, v)
                fun visit (w, (ok, frontier)) =
                  if not ok then (false, frontier)
                  else if Array.sub (color, w) = 0 then
                    (Array.update (color, w, 3 - vcolor); (true, w :: frontier))
                  else if Array.sub (color, w) <> vcolor then (true, frontier)
                  else (false, frontier)
                val (ok, newly_colored) = List.foldl visit (true, []) (adj v)
              in
                if not ok then false else go (rest @ newly_colored)
              end
      in
        Array.update (color, start, 1);
        go [start]
      end
  in
    List.all
      (fn v => Array.sub (color, v) <> 0 orelse bfs v)
      (List.tabulate (n, fn i => i))
  end

val bipartite_adj =
  fn 0 => [1, 3]
   | 1 => [0, 2]
   | 2 => [1, 3]
   | 3 => [0, 2]
   | _ => []

val odd_cycle_adj =
  fn 0 => [1, 2]
   | 1 => [0, 2]
   | 2 => [0, 1]
   | _ => []

val () = print (Bool.toString (is_bipartite (bipartite_adj, 4)) ^ "\n")
val () = print (Bool.toString (is_bipartite (odd_cycle_adj, 3)) ^ "\n")

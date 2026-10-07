val inf = 1000000000

(* Prim's minimum-spanning-tree algorithm over a dense adjacency
   matrix, picking the cheapest frontier edge each step (no heap,
   O(n^2) which is fine for the small demo graph below). *)
fun prim_mst (graph, n) =
  let
    val in_mst = Array.array (n, false)
    val key = Array.array (n, inf)
    val () = Array.update (key, 0, 0)
    val total = ref 0

    fun pick_min () =
      let
        fun go (i, best, best_val) =
          if i >= n then best
          else if not (Array.sub (in_mst, i)) andalso Array.sub (key, i) < best_val
          then go (i + 1, i, Array.sub (key, i))
          else go (i + 1, best, best_val)
      in
        go (0, ~1, inf + 1)
      end

    fun step () =
      let
        val u = pick_min ()
      in
        if u = ~1 then ()
        else
          (Array.update (in_mst, u, true);
           total := !total + Array.sub (key, u);
           List.app
             (fn v =>
               let
                 val w = Array.sub (Array.sub (graph, u), v)
               in
                 if w > 0 andalso not (Array.sub (in_mst, v)) andalso w < Array.sub (key, v)
                 then Array.update (key, v, w)
                 else ()
               end)
             (List.tabulate (n, fn i => i));
           step ())
      end
  in
    step ();
    !total
  end

val graph =
  Array.fromList
    (map Array.fromList
      [[0, 2, 0, 6, 0],
       [2, 0, 3, 8, 5],
       [0, 3, 0, 0, 7],
       [6, 8, 0, 0, 9],
       [0, 5, 7, 9, 0]])

val () = print (Int.toString (prim_mst (graph, 5)) ^ "\n")

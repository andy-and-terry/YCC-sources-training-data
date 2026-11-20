(* Shoelace polygon area. *)
fun area pts =
  let
    val nxt = tl pts @ [hd pts]
    fun cross ((x1, y1), (x2, y2)) = x1 * y2 - x2 * y1
    val s = ListPair.foldl (fn (a, b, acc) => acc + cross (a, b)) 0.0 (pts, nxt)
  in Real.abs s / 2.0 end
val _ = print (Real.toString (area [(0.0, 0.0), (4.0, 0.0), (4.0, 3.0), (0.0, 3.0)]) ^ "\n")

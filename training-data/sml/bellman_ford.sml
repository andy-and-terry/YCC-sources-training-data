val inf = 1000000

fun bellman_ford (edges, n, source) =
  let
    val dist = Array.array (n, inf)
    val () = Array.update (dist, source, 0)
    fun relax_once () =
      List.app
        (fn (u, v, w) =>
          if Array.sub (dist, u) <> inf andalso Array.sub (dist, u) + w < Array.sub (dist, v)
          then Array.update (dist, v, Array.sub (dist, u) + w)
          else ())
        edges
    fun repeat 0 = ()
      | repeat k = (relax_once (); repeat (k - 1))
    val () = repeat (n - 1)
    val has_negative_cycle =
      List.exists
        (fn (u, v, w) =>
          Array.sub (dist, u) <> inf andalso Array.sub (dist, u) + w < Array.sub (dist, v))
        edges
  in
    if has_negative_cycle then NONE else SOME dist
  end

val edges = [(0, 1, 4), (0, 2, 5), (1, 2, ~3), (2, 3, 4), (3, 1, 1)]

val () =
  case bellman_ford (edges, 4, 0) of
    SOME dist => print (String.concatWith " " (map Int.toString (Array.foldr (op ::) [] dist)) ^ "\n")
  | NONE => print "negative cycle detected\n"

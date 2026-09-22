val inf = 1000000

fun make_matrix n init =
  Array.tabulate (n, fn _ => Array.tabulate (n, fn _ => init))

fun mref (m, i, j) = Array.sub (Array.sub (m, i), j)
fun mset (m, i, j, v) = Array.update (Array.sub (m, i), j, v)

fun floyd_warshall (edges, n) =
  let
    val dist = make_matrix n inf
    val () = List.app (fn i => mset (dist, i, i, 0)) (List.tabulate (n, fn i => i))
    val () = List.app (fn (u, v, w) => mset (dist, u, v, w)) edges
    val () =
      List.app
        (fn k =>
          List.app
            (fn i =>
              List.app
                (fn j =>
                  if mref (dist, i, k) + mref (dist, k, j) < mref (dist, i, j)
                  then mset (dist, i, j, mref (dist, i, k) + mref (dist, k, j))
                  else ())
                (List.tabulate (n, fn j => j)))
            (List.tabulate (n, fn i => i)))
        (List.tabulate (n, fn k => k))
  in
    dist
  end

val edges = [(0, 1, 3), (1, 2, 1), (0, 2, 10), (2, 3, 2), (1, 3, 7)]
val result = floyd_warshall (edges, 4)

val () = print (Int.toString (mref (result, 0, 3)) ^ "\n")
val () = print (Int.toString (mref (result, 0, 2)) ^ "\n")

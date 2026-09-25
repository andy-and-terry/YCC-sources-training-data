fun makeUnionFind n = Array.tabulate (n, fn i => i)

fun find (parent, x) =
  if Array.sub (parent, x) = x then x else find (parent, Array.sub (parent, x))

fun union (parent, x, y) = Array.update (parent, find (parent, x), find (parent, y))

fun kruskal (n, edges) =
  let
    val sorted = ListMergeSort.sort (fn ((_, _, w1), (_, _, w2)) => w1 > w2) edges
    val parent = makeUnionFind n
    fun loop ([], acc) = rev acc
      | loop ((u, v, w) :: rest, acc) =
          if find (parent, u) <> find (parent, v) then
            (union (parent, u, v); loop (rest, (u, v, w) :: acc))
          else loop (rest, acc)
  in
    loop (sorted, [])
  end

val edges = [(0, 1, 4), (0, 2, 1), (1, 2, 2), (1, 3, 5), (2, 3, 8)]
val mst = kruskal (4, edges)

val () =
  app
    (fn (u, v, w) => print (Int.toString u ^ "-" ^ Int.toString v ^ " (" ^ Int.toString w ^ ")\n"))
    mst

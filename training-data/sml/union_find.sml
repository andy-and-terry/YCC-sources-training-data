fun make_union_find n = Array.tabulate (n, fn i => i)

fun uf_find (parent, x) =
  if Array.sub (parent, x) = x then x else uf_find (parent, Array.sub (parent, x))

fun uf_union (parent, x, y) =
  let
    val rootX = uf_find (parent, x)
    val rootY = uf_find (parent, y)
  in
    if rootX <> rootY then Array.update (parent, rootX, rootY) else ()
  end

val parent = make_union_find 5
val () = uf_union (parent, 0, 1)
val () = uf_union (parent, 1, 2)
val () = print (Bool.toString (uf_find (parent, 0) = uf_find (parent, 2)) ^ "\n")
val () = print (Bool.toString (uf_find (parent, 0) = uf_find (parent, 3)) ^ "\n")

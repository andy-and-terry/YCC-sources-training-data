datatype 'a tree = Leaf | Node of 'a tree * 'a * 'a tree

fun insert cmp x Leaf = Node (Leaf, x, Leaf)
  | insert cmp x (t as Node (l, v, r)) =
      case cmp (x, v) of
        LESS => Node (insert cmp x l, v, r)
      | GREATER => Node (l, v, insert cmp x r)
      | EQUAL => t

fun foldTree f init Leaf = init
  | foldTree f init (Node (l, v, r)) =
      foldTree f (f (v, foldTree f init l)) r

fun mapTree f Leaf = Leaf
  | mapTree f (Node (l, v, r)) = Node (mapTree f l, f v, mapTree f r)

fun toList t = rev (foldTree (op ::) [] t)
fun size t = foldTree (fn (_, n) => n + 1) 0 t
fun depth Leaf = 0
  | depth (Node (l, _, r)) = 1 + Int.max (depth l, depth r)

val ints = foldl (fn (x, t) => insert Int.compare x t) Leaf [5, 2, 8, 1, 9, 3, 5]
val () = print (String.concatWith " " (map Int.toString (toList ints)) ^ "\n")
val () = print (Int.toString (size ints) ^ " " ^ Int.toString (depth ints) ^ "\n")
val () = print (Int.toString (foldTree (op +) 0 ints) ^ "\n")

val words = foldl (fn (x, t) => insert String.compare x t) Leaf ["pear", "apple", "fig"]
val () = print (String.concatWith "," (toList words) ^ "\n")
val () = print (String.concatWith "," (toList (mapTree Int.toString (mapTree String.size words))) ^ "\n")

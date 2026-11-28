datatype 'a tree = Leaf | Node of 'a tree * 'a * 'a tree

fun insert cmp x Leaf = Node (Leaf, x, Leaf)
  | insert cmp x (t as Node (l, v, r)) =
      case cmp (x, v) of
        LESS => Node (insert cmp x l, v, r)
      | GREATER => Node (l, v, insert cmp x r)
      | EQUAL => t

fun toList Leaf = []
  | toList (Node (l, v, r)) = toList l @ [v] @ toList r

val _ = print (String.concatWith "," (map Int.toString (toList (foldl (fn (x, t) => insert Int.compare x t) Leaf [3, 1, 2, 3]))) ^ "\n")

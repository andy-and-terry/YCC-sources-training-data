datatype shape = Circle of real | Rect of real * real | Tri of real * real * real

fun area (Circle r) = 3.14159 * r * r
  | area (Rect (w, h)) = w * h
  | area (Tri (a, b, c)) = let val s = (a + b + c) / 2.0 in Math.sqrt (s * (s - a) * (s - b) * (s - c)) end

datatype 'a tree = Leaf | Node of 'a tree * 'a * 'a tree

fun insert cmp x Leaf = Node (Leaf, x, Leaf)
  | insert cmp x (t as Node (l, v, r)) =
      case cmp (x, v) of
          LESS => Node (insert cmp x l, v, r)
        | GREATER => Node (l, v, insert cmp x r)
        | EQUAL => t

fun inorder Leaf = []
  | inorder (Node (l, v, r)) = inorder l @ [v] @ inorder r

val t = foldl (fn (x, acc) => insert Int.compare x acc) Leaf [5, 3, 8, 1, 4, 9]
val _ = print (String.concatWith "," (map Int.toString (inorder t)) ^ "\n")
val _ = app (fn s => print (Real.fmt (StringCvt.FIX (SOME 2)) (area s) ^ "\n")) [Circle 1.0, Rect (2.0, 3.0), Tri (3.0, 4.0, 5.0)]

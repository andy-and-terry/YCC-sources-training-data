datatype avl = Leaf | Node of avl * int * avl * int

fun height Leaf = 0
  | height (Node (_, _, _, h)) = h

fun mkNode (l, v, r) = Node (l, v, r, 1 + Int.max (height l, height r))

fun balanceFactor Leaf = 0
  | balanceFactor (Node (l, _, r, _)) = height l - height r

fun rotateRight (Node (Node (ll, lv, lr, _), v, r, _)) = mkNode (ll, lv, mkNode (lr, v, r))
  | rotateRight t = t

fun rotateLeft (Node (l, v, Node (rl, rv, rr, _), _)) = mkNode (mkNode (l, v, rl), rv, rr)
  | rotateLeft t = t

fun rebalance (t as Node (l, v, r, _)) =
      let val bf = balanceFactor t in
        if bf > 1 then
          if balanceFactor l < 0 then rotateRight (mkNode (rotateLeft l, v, r))
          else rotateRight t
        else if bf < ~1 then
          if balanceFactor r > 0 then rotateLeft (mkNode (l, v, rotateRight r))
          else rotateLeft t
        else t
      end
  | rebalance Leaf = Leaf

fun insert (Leaf, x) = mkNode (Leaf, x, Leaf)
  | insert (Node (l, v, r, _), x) =
      if x < v then rebalance (mkNode (insert (l, x), v, r))
      else if x > v then rebalance (mkNode (l, v, insert (r, x)))
      else mkNode (l, v, r)

fun inorder Leaf = []
  | inorder (Node (l, v, r, _)) = inorder l @ [v] @ inorder r

val tree = foldl (fn (x, t) => insert (t, x)) Leaf [10, 20, 30, 40, 50, 25]
val () = print (String.concatWith " " (map Int.toString (inorder tree)) ^ "\n")
val () = print ("height: " ^ Int.toString (height tree) ^ "\n")

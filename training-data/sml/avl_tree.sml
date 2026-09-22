datatype avltree = Leaf | Node of avltree * int * int * avltree

fun height Leaf = 0
  | height (Node (_, _, h, _)) = h

fun mkNode (l, x, r) = Node (l, x, 1 + Int.max (height l, height r), r)

fun balanceFactor Leaf = 0
  | balanceFactor (Node (l, _, _, r)) = height l - height r

fun rotateRight (Node (Node (ll, lx, _, lr), x, _, r)) = mkNode (ll, lx, mkNode (lr, x, r))
  | rotateRight t = t

fun rotateLeft (Node (l, x, _, Node (rl, rx, _, rr))) = mkNode (mkNode (l, x, rl), rx, rr)
  | rotateLeft t = t

fun balance t =
  let val bf = balanceFactor t in
    if bf > 1 then
      (case t of
         Node (l, x, _, r) =>
           if balanceFactor l < 0 then rotateRight (mkNode (rotateLeft l, x, r))
           else rotateRight t
       | Leaf => t)
    else if bf < ~1 then
      (case t of
         Node (l, x, _, r) =>
           if balanceFactor r > 0 then rotateLeft (mkNode (l, x, rotateRight r))
           else rotateLeft t
       | Leaf => t)
    else t
  end

fun insert (Leaf, x) = mkNode (Leaf, x, Leaf)
  | insert (Node (l, y, _, r), x) =
      if x < y then balance (mkNode (insert (l, x), y, r))
      else if x > y then balance (mkNode (l, y, insert (r, x)))
      else Node (l, y, 1 + Int.max (height l, height r), r)

fun inorder Leaf = []
  | inorder (Node (l, x, _, r)) = inorder l @ [x] @ inorder r

val tree = List.foldl (fn (x, t) => insert (t, x)) Leaf [10, 20, 30, 40, 50, 25]
val () = print (String.concatWith " " (map Int.toString (inorder tree)) ^ "\n")
val () = print (Int.toString (height tree) ^ "\n")

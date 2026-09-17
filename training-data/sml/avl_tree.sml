datatype avl = Leaf | Node of avl * int * avl * int (* left, value, right, height *)

fun height Leaf = 0
  | height (Node (_, _, _, h)) = h

fun mk_node (l, x, r) = Node (l, x, r, 1 + Int.max (height l, height r))

fun balance_factor Leaf = 0
  | balance_factor (Node (l, _, r, _)) = height l - height r

fun rotate_left (Node (l, x, Node (rl, y, rr, _), _)) = mk_node (mk_node (l, x, rl), y, rr)
  | rotate_left t = t

fun rotate_right (Node (Node (ll, y, lr, _), x, r, _)) = mk_node (ll, y, mk_node (lr, x, r))
  | rotate_right t = t

fun rebalance Leaf = Leaf
  | rebalance (t as Node (l, x, r, _)) =
      let
        val bf = balance_factor t
      in
        if bf > 1 then
          if balance_factor l >= 0 then rotate_right t
          else rotate_right (mk_node (rotate_left l, x, r))
        else if bf < ~1 then
          if balance_factor r <= 0 then rotate_left t
          else rotate_left (mk_node (l, x, rotate_right r))
        else t
      end

fun insert (Leaf, x) = mk_node (Leaf, x, Leaf)
  | insert (Node (l, y, r, _), x) =
      if x < y then rebalance (mk_node (insert (l, x), y, r))
      else if x > y then rebalance (mk_node (l, y, insert (r, x)))
      else Node (l, y, r, 1 + Int.max (height l, height r))

fun inorder Leaf = []
  | inorder (Node (l, x, r, _)) = inorder l @ [x] @ inorder r

val tree = List.foldl (fn (x, t) => insert (t, x)) Leaf [10, 20, 30, 40, 50, 25]
val () = print (String.concatWith " " (map Int.toString (inorder tree)) ^ "\n")
val () = print (Int.toString (height tree) ^ "\n")

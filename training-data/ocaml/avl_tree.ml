type avl = Leaf | Node of avl * int * avl * int

let height = function Leaf -> 0 | Node (_, _, _, h) -> h

let make l v r = Node (l, v, r, 1 + max (height l) (height r))

let balance_factor = function Leaf -> 0 | Node (l, _, r, _) -> height l - height r

let rotate_right = function
  | Node (Node (ll, lv, lr, _), v, r, _) -> make ll lv (make lr v r)
  | t -> t

let rotate_left = function
  | Node (l, v, Node (rl, rv, rr, _), _) -> make (make l v rl) rv rr
  | t -> t

let rebalance t =
  let bf = balance_factor t in
  if bf > 1 then
    match t with
    | Node (l, v, r, _) when balance_factor l < 0 -> rotate_right (make (rotate_left l) v r)
    | _ -> rotate_right t
  else if bf < -1 then
    match t with
    | Node (l, v, r, _) when balance_factor r > 0 -> rotate_left (make l v (rotate_right r))
    | _ -> rotate_left t
  else t

let rec insert value = function
  | Leaf -> make Leaf value Leaf
  | Node (l, v, r, _) as t ->
      if value < v then rebalance (make (insert value l) v r)
      else if value > v then rebalance (make l v (insert value r))
      else t

let rec inorder = function
  | Leaf -> []
  | Node (l, v, r, _) -> inorder l @ [ v ] @ inorder r

let () =
  let tree = List.fold_left (fun t x -> insert x t) Leaf [ 10; 20; 30; 40; 50; 25 ] in
  inorder tree |> List.map string_of_int |> String.concat " " |> print_endline;
  Printf.printf "%d\n" (height tree)

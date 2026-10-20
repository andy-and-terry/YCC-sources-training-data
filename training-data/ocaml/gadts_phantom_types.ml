type _ expr =
  | Int : int -> int expr
  | Bool : bool -> bool expr
  | Add : int expr * int expr -> int expr
  | If : bool expr * 'a expr * 'a expr -> 'a expr
  | Eq : int expr * int expr -> bool expr

let rec eval : type a. a expr -> a = function
  | Int n -> n
  | Bool b -> b
  | Add (a, b) -> eval a + eval b
  | If (c, t, e) -> if eval c then eval t else eval e
  | Eq (a, b) -> eval a = eval b

let () =
  Printf.printf "%d\n" (eval (If (Eq (Add (Int 1, Int 2), Int 3), Int 10, Int 20)))

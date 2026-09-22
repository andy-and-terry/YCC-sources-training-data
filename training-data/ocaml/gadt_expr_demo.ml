(* A GADT lets each constructor fix the type parameter of the value it
   builds, so `eval` below can return an `int` for an `IntLit`/`Add`
   node and a `bool` for a `Bool`/`If` node from a single well-typed
   recursive function, with no unsafe casts. *)
type _ expr =
  | IntLit : int -> int expr
  | BoolLit : bool -> bool expr
  | Add : int expr * int expr -> int expr
  | Eq : int expr * int expr -> bool expr
  | If : bool expr * 'a expr * 'a expr -> 'a expr

let rec eval : type a. a expr -> a = function
  | IntLit n -> n
  | BoolLit b -> b
  | Add (a, b) -> eval a + eval b
  | Eq (a, b) -> eval a = eval b
  | If (c, t, f) -> if eval c then eval t else eval f

let () =
  let program = If (Eq (Add (IntLit 2, IntLit 3), IntLit 5), IntLit 100, IntLit 0) in
  Printf.printf "%d\n" (eval program);
  Printf.printf "%b\n" (eval (Eq (IntLit 1, IntLit 1)))

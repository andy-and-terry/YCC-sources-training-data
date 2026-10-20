type expr =
  | Num of float
  | Add of expr * expr
  | Mul of expr * expr
  | Neg of expr
  | Var of string

let rec eval env = function
  | Num n -> n
  | Add (a, b) -> eval env a +. eval env b
  | Mul (a, b) -> eval env a *. eval env b
  | Neg e -> -. (eval env e)
  | Var v -> List.assoc v env

let rec show = function
  | Num n -> string_of_float n
  | Add (a, b) -> "(" ^ show a ^ " + " ^ show b ^ ")"
  | Mul (a, b) -> show a ^ " * " ^ show b
  | Neg e -> "-" ^ show e
  | Var v -> v

let () =
  let e = Add (Num 2., Mul (Var "x", Neg (Num 3.))) in
  Printf.printf "%s = %g\n" (show e) (eval [ ("x", 4.) ] e)

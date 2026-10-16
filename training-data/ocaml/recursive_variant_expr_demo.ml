type expr =
  | Num of float
  | Var of string
  | Add of expr * expr
  | Mul of expr * expr
  | Neg of expr

let rec eval env = function
  | Num n -> n
  | Var v -> List.assoc v env
  | Add (a, b) -> eval env a +. eval env b
  | Mul (a, b) -> eval env a *. eval env b
  | Neg a -> -.eval env a

let rec to_string = function
  | Num n -> Printf.sprintf "%g" n
  | Var v -> v
  | Add (a, b) -> "(" ^ to_string a ^ " + " ^ to_string b ^ ")"
  | Mul (a, b) -> to_string a ^ " * " ^ to_string b
  | Neg a -> "-" ^ to_string a

let () =
  let e = Add (Mul (Num 3., Var "x"), Neg (Num 4.)) in
  print_endline (to_string e);
  Printf.printf "x=5 -> %g\n" (eval [ ("x", 5.) ] e)

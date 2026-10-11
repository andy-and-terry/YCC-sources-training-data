type expr = Const of float | X | Add of expr * expr | Mul of expr * expr | Pow of expr * int

let rec deriv = function
  | Const _ -> Const 0.
  | X -> Const 1.
  | Add (a, b) -> Add (deriv a, deriv b)
  | Mul (a, b) -> Add (Mul (deriv a, b), Mul (a, deriv b))
  | Pow (a, n) -> Mul (Mul (Const (float_of_int n), Pow (a, n - 1)), deriv a)

let rec eval x = function
  | Const c -> c
  | X -> x
  | Add (a, b) -> eval x a +. eval x b
  | Mul (a, b) -> eval x a *. eval x b
  | Pow (a, n) -> eval x a ** float_of_int n

let () =
  let f = Add (Pow (X, 3), Mul (Const 2., X)) in
  let f' = deriv f in
  Printf.printf "f(2) = %g\n" (eval 2. f);
  Printf.printf "f'(2) = %g\n" (eval 2. f')

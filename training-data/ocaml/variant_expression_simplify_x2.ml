type expr = Num of int | Add of expr * expr | Mul of expr * expr

let rec simplify = function
  | Add (Num 0, e) | Add (e, Num 0) -> simplify e
  | Mul (Num 1, e) | Mul (e, Num 1) -> simplify e
  | Add (a, b) -> Add (simplify a, simplify b)
  | Mul (a, b) -> Mul (simplify a, simplify b)
  | e -> e

let () = match simplify (Add (Num 0, Mul (Num 1, Num 7))) with Num n -> print_int n | _ -> ()

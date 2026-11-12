type expr = Num of int | Add of expr * expr | Neg of expr
let rec eval = function
  | Num n -> n
  | Add (a, b) -> eval a + eval b
  | Neg e -> - (eval e)
let () = Printf.printf "%d\n" (eval (Add (Num 5, Neg (Num 2))))

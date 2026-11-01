type expr = Num of int | Add of expr * expr | Mul of expr * expr | Neg of expr

let rec eval = function
  | Num n -> n
  | Add (a, b) -> eval a + eval b
  | Mul (a, b) -> eval a * eval b
  | Neg a -> - (eval a)

let () = Printf.printf "%d\n" (eval (Add (Num 2, Mul (Num 3, Neg (Num 4)))))

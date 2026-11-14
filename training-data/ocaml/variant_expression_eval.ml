type expr = Num of int | Add of expr * expr | Mul of expr * expr

let rec eval = function
  | Num n -> n
  | Add (a, b) -> eval a + eval b
  | Mul (a, b) -> eval a * eval b

let () = Printf.printf "%d\n" (eval (Add (Num 2, Mul (Num 3, Num 4))))

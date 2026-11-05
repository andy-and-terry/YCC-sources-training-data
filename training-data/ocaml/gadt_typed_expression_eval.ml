type _ t =
  | Int : int -> int t
  | Bool : bool -> bool t
  | If : bool t * 'a t * 'a t -> 'a t
  | Add : int t * int t -> int t

let rec eval : type a. a t -> a = function
  | Int n -> n
  | Bool b -> b
  | If (c, a, b) -> if eval c then eval a else eval b
  | Add (a, b) -> eval a + eval b

let () = Printf.printf "%d\n" (eval (If (Bool true, Add (Int 1, Int 2), Int 0)))

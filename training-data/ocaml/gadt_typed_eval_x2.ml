type _ t =
  | Int : int -> int t
  | Bool : bool -> bool t
  | If : bool t * 'a t * 'a t -> 'a t

let rec eval : type a. a t -> a = function
  | Int n -> n
  | Bool b -> b
  | If (c, a, b) -> if eval c then eval a else eval b

let () = print_int (eval (If (Bool true, Int 1, Int 2)))

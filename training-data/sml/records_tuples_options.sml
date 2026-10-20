type person = {name : string, age : int, email : string option}
val p : person = {name = "Ada", age = 36, email = NONE}
val q = {name = #name p, age = #age p + 1, email = SOME "ada@x.org"}
fun show ({name, age, email} : person) = name ^ " " ^ Int.toString age ^ " " ^ (case email of SOME e => e | NONE => "-")
val _ = print (show p ^ "\n" ^ show q ^ "\n")
val (a, b, c) = (1, "two", 3.0)
val _ = print (Int.toString a ^ b ^ Real.toString c ^ "\n")
val t = (1, (2, 3))
val _ = print (Int.toString (#1 (#2 t)) ^ "\n")
fun lookup (k, []) = NONE
  | lookup (k, (k', v) :: rest) = if k = k' then SOME v else lookup (k, rest)
val db = [("a", 1), ("b", 2)]
val _ = print (Int.toString (getOpt (lookup ("b", db), 0)) ^ Int.toString (getOpt (lookup ("z", db), ~1)) ^ "\n")
val _ = print (Bool.toString (isSome (lookup ("a", db))) ^ "\n")
val _ = print (case Option.map (fn x => x * 10) (lookup ("a", db)) of SOME v => Int.toString v | NONE => "none")
val _ = print "\n"
fun swap (x, y) = (y, x)
val _ = print (Int.toString (#1 (swap (1, 2))) ^ "\n")

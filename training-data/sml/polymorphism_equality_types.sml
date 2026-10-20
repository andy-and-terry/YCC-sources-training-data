fun id x = x
fun pair x y = (x, y)
fun map2 f (a, b) = (f a, f b)
fun contains x [] = false
  | contains x (y :: ys) = x = y orelse contains x ys
fun maxBy cmp (x :: xs) = foldl (fn (a, b) => if cmp (a, b) = GREATER then a else b) x xs
  | maxBy _ [] = raise Empty
datatype ('a, 'b) either = Left of 'a | Right of 'b
fun partitionEithers es = foldr (fn (Left a, (ls, rs)) => (a :: ls, rs) | (Right b, (ls, rs)) => (ls, b :: rs)) ([], []) es
val _ = print (Int.toString (id 5) ^ id "s" ^ "\n")
val (a, b) = pair 1 "x"
val _ = print (Int.toString a ^ b ^ "\n")
val (x, y) = map2 (fn n => n * 2) (3, 4)
val _ = print (Int.toString (x + y) ^ " " ^ Bool.toString (contains 3 [1, 2, 3]) ^ Bool.toString (contains "z" ["a"]) ^ "\n")
val _ = print (Int.toString (maxBy Int.compare [3, 9, 4]) ^ " " ^ maxBy String.compare ["pear", "apple"] ^ "\n")
val (ls, rs) = partitionEithers [Left 1, Right "a", Left 2, Right "b"]
val _ = print (Int.toString (length ls) ^ String.concat rs ^ "\n")

fun curry f a b = f (a, b)
fun uncurry f (a, b) = f a b
fun compose f g x = f (g x)
infix 3 o2
fun f o2 g = fn x => f (g x)
fun twice f = f o f
fun iterate 0 f x = x
  | iterate n f x = iterate (n - 1) f (f x)
val add = curry (op+)
val inc = add 1
val _ = print (Int.toString (inc 41) ^ "\n")
val _ = print (Int.toString ((twice inc) 5) ^ "\n")
val _ = print (Int.toString (iterate 10 (fn x => x * 2) 1) ^ "\n")
val _ = print (Int.toString ((inc o2 (fn x => x * 3)) 4) ^ "\n")
val _ = print (Int.toString (uncurry add (3, 4)) ^ "\n")
val pipeline = List.map (fn x => x + 1) o List.filter (fn x => x mod 2 = 0)
val _ = print (String.concatWith "," (map Int.toString (pipeline [1, 2, 3, 4, 5, 6])) ^ "\n")
fun flip f (a, b) = f (b, a)
val _ = print (Int.toString (flip op- (1, 10)) ^ "\n")
val counter = let val r = ref 0 in fn () => (r := !r + 1; !r) end
val _ = (counter (); counter ())
val _ = print (Int.toString (counter ()) ^ "\n")

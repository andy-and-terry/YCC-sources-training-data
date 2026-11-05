signature ORD = sig type t val lt : t * t -> bool end

functor MaxOf (O : ORD) = struct
  fun max (x :: xs) = foldl (fn (y, m) => if O.lt (m, y) then y else m) x xs
    | max [] = raise Empty
end

structure IntMax = MaxOf (struct type t = int fun lt (a, b) = a < b end)
val _ = print (Int.toString (IntMax.max [3, 9, 4]) ^ "\n")

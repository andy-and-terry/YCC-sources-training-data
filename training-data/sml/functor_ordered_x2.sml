signature ORD = sig type t val lt : t * t -> bool end
functor MaxOf (O : ORD) = struct
  fun max (a, b) = if O.lt (a, b) then b else a
end
structure IntOrd = struct type t = int fun lt (a, b) = a < b end
structure M = MaxOf (IntOrd)
val _ = print (Int.toString (M.max (3, 9)) ^ "\n")

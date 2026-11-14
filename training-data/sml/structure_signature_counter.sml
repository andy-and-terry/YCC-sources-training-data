signature COUNTER = sig
  type t
  val new : t
  val inc : t -> t
  val get : t -> int
end

structure C :> COUNTER = struct
  type t = int
  val new = 0
  fun inc n = n + 1
  fun get n = n
end

val _ = print (Int.toString (C.get (C.inc (C.inc C.new))) ^ "\n")

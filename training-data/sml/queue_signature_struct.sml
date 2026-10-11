signature COUNTER =
sig
  type t
  val zero : t
  val inc : t -> t
  val value : t -> int
end

structure Counter :> COUNTER =
struct
  type t = int
  val zero = 0
  fun inc n = n + 1
  fun value n = n
end

val c = Counter.inc (Counter.inc Counter.zero)
val () = print (Int.toString (Counter.value c) ^ "\n")

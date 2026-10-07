(* abstype hides its representation outside the `with ... end` block:
   code elsewhere can only build/inspect a counter through the
   functions exported here, never by pattern-matching the constructor. *)

abstype counter = Counter of int
with
  fun makeCounter n = Counter n
  fun increment (Counter n) = Counter (n + 1)
  fun value (Counter n) = n
end

val c0 = makeCounter 0
val c1 = increment (increment c0)
val c2 = increment c1

val () = print (Int.toString (value c0) ^ "\n")
val () = print (Int.toString (value c2) ^ "\n")

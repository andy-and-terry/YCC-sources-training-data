(* Opaque ascription (:>) hides the representation of an abstract type. *)
signature COUNTER = sig
  type t
  val zero : t
  val increment : t -> t
  val add : t * int -> t
  val value : t -> int
end

structure Counter :> COUNTER = struct
  type t = int
  val zero = 0
  fun increment c = c + 1
  fun add (c, n) = if n < 0 then c else c + n
  fun value c = c
end

val c = Counter.add (Counter.increment (Counter.increment Counter.zero), 10)
val () = print (Int.toString (Counter.value c) ^ "\n")

signature STACK = sig
  type 'a stack
  exception Empty
  val empty : 'a stack
  val push : 'a * 'a stack -> 'a stack
  val pop : 'a stack -> 'a * 'a stack
  val size : 'a stack -> int
end

structure ListStack :> STACK = struct
  type 'a stack = 'a list
  exception Empty
  val empty = []
  fun push (x, s) = x :: s
  fun pop [] = raise Empty
    | pop (x :: s) = (x, s)
  val size = length
end

val s = ListStack.push (2, ListStack.push (1, ListStack.empty))
val (top, rest) = ListStack.pop s
val () = print (Int.toString top ^ " " ^ Int.toString (ListStack.size rest) ^ "\n")
val () = (ignore (ListStack.pop ListStack.empty); print "unreachable\n")
         handle ListStack.Empty => print "stack was empty\n"

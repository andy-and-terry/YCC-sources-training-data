signature COUNTER =
sig
  type t
  val create : int -> t
  val increment : t -> t
  val value : t -> int
end

(* opaque ascription hides the representation *)
structure Counter :> COUNTER =
struct
  type t = int
  fun create n = n
  fun increment c = c + 1
  fun value c = c
end

structure OpenCounter : COUNTER =
struct
  type t = int
  fun create n = n
  fun increment c = c + 1
  fun value c = c
end

val c = Counter.increment (Counter.increment (Counter.create 5))
val () = print (Int.toString (Counter.value c) ^ "\n")

(* transparent ascription exposes t = int, so this is legal *)
val raw : int = OpenCounter.increment (OpenCounter.create 1)
val () = print (Int.toString raw ^ "\n")

(* the line below would not type check with the opaque Counter:
   val bad : int = Counter.create 3 *)

signature STACK =
sig
  type 'a stack
  exception Empty
  val empty : 'a stack
  val push : 'a * 'a stack -> 'a stack
  val pop : 'a stack -> 'a * 'a stack
end

structure Stack :> STACK =
struct
  type 'a stack = 'a list
  exception Empty
  val empty = []
  fun push (x, s) = x :: s
  fun pop [] = raise Empty
    | pop (x :: s) = (x, s)
end

val (top, _) = Stack.pop (Stack.push (42, Stack.empty))
val () = print (Int.toString top ^ "\n")
val () = print ((Stack.pop (Stack.empty : int Stack.stack); "no error") handle Stack.Empty => "empty stack")
val () = print "\n"

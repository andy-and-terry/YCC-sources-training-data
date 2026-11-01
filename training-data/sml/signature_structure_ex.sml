signature STACK = sig
  type 'a t
  val empty : 'a t
  val push : 'a * 'a t -> 'a t
  val pop : 'a t -> ('a * 'a t) option
end

structure ListStack :> STACK = struct
  type 'a t = 'a list
  val empty = []
  fun push (x, s) = x :: s
  fun pop [] = NONE
    | pop (x :: s) = SOME (x, s)
end

val s = ListStack.push (1, ListStack.push (2, ListStack.empty))
val () = case ListStack.pop s of SOME (x, _) => print (Int.toString x ^ "\n") | NONE => ()

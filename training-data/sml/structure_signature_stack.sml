signature STACK = sig
  type 'a stack
  val empty : 'a stack
  val push : 'a * 'a stack -> 'a stack
  val pop : 'a stack -> ('a * 'a stack) option
end

structure ListStack :> STACK = struct
  type 'a stack = 'a list
  val empty = []
  fun push (x, s) = x :: s
  fun pop [] = NONE
    | pop (x :: s) = SOME (x, s)
end

val s = ListStack.push (2, ListStack.push (1, ListStack.empty))
val () =
  case ListStack.pop s of
      SOME (x, _) => print (Int.toString x ^ "\n")
    | NONE => print "empty\n"

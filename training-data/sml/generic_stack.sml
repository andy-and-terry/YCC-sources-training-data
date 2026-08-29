signature STACK = sig
  type 'a stack
  val empty : 'a stack
  val push : 'a * 'a stack -> 'a stack
  val pop : 'a stack -> 'a * 'a stack
end

structure Stack :> STACK = struct
  type 'a stack = 'a list
  val empty = []
  fun push (x, s) = x :: s
  fun pop (x :: s) = (x, s)
    | pop [] = raise Fail "empty stack"
end

val s0 = Stack.empty
val s1 = Stack.push (1, s0)
val s2 = Stack.push (2, s1)
val s3 = Stack.push (3, s2)
val (top1, s4) = Stack.pop s3
val (top2, s5) = Stack.pop s4
val () = print (Int.toString top1 ^ "\n")
val () = print (Int.toString top2 ^ "\n")

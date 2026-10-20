signature STACK =
sig
  type 'a stack
  val empty : 'a stack
  val push : 'a * 'a stack -> 'a stack
  val pop : 'a stack -> ('a * 'a stack) option
  val size : 'a stack -> int
end

structure ListStack :> STACK =
struct
  type 'a stack = 'a list
  val empty = []
  fun push (x, s) = x :: s
  fun pop [] = NONE | pop (x :: s) = SOME (x, s)
  val size = length
end

signature ORD = sig type t val compare : t * t -> order end

functor MakeSet (O : ORD) =
struct
  type set = O.t list
  val empty : set = []
  fun member (x, s) = List.exists (fn y => O.compare (x, y) = EQUAL) s
  fun add (x, s) = if member (x, s) then s else x :: s
  fun size (s : set) = length s
end

structure IntSet = MakeSet (struct type t = int val compare = Int.compare end)

val s = ListStack.push (2, ListStack.push (1, ListStack.empty))
val _ = print (Int.toString (ListStack.size s) ^ "\n")
val _ = case ListStack.pop s of SOME (x, _) => print (Int.toString x ^ "\n") | NONE => ()
val is = IntSet.add (3, IntSet.add (3, IntSet.add (4, IntSet.empty)))
val _ = print (Int.toString (IntSet.size is) ^ Bool.toString (IntSet.member (4, is)) ^ "\n")

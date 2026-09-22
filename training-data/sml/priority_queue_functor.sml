signature ORDERED = sig
  type t
  val compare : t * t -> order
end

signature PRIORITY_QUEUE = sig
  type item
  type queue
  val empty : queue
  val isEmpty : queue -> bool
  val insert : queue * item -> queue
  val extractMin : queue -> item * queue
end

functor MakePriorityQueue (O : ORDERED) :> PRIORITY_QUEUE where type item = O.t = struct
  type item = O.t
  type queue = item list

  val empty = []

  fun isEmpty q = List.null q

  fun insert (q, x) = x :: q

  fun minOf [x] = x
    | minOf (x :: xs) =
        let val m = minOf xs in if O.compare (x, m) = LESS then x else m end
    | minOf [] = raise Fail "empty queue"

  fun remove (_, []) = []
    | remove (x, y :: ys) =
        if O.compare (x, y) = EQUAL then ys else y :: remove (x, ys)

  fun extractMin [] = raise Fail "empty queue"
    | extractMin q = let val m = minOf q in (m, remove (m, q)) end
end

structure IntOrdered = struct
  type t = int
  fun compare (a, b) = Int.compare (a, b)
end

structure IntPQ = MakePriorityQueue (IntOrdered)

fun drain (q, acc) =
  if IntPQ.isEmpty q then rev acc
  else
    let val (m, q') = IntPQ.extractMin q in drain (q', m :: acc) end

val queue = List.foldl (fn (x, q) => IntPQ.insert (q, x)) IntPQ.empty [5, 3, 8, 1, 4]
val sorted = drain (queue, [])

val () = print (String.concatWith " " (map Int.toString sorted) ^ "\n")

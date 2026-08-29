signature QUEUE = sig
  type 'a queue
  val empty : 'a queue
  val enqueue : 'a * 'a queue -> 'a queue
  val dequeue : 'a queue -> 'a * 'a queue
end

structure Queue :> QUEUE = struct
  type 'a queue = 'a list * 'a list
  val empty = ([], [])
  fun enqueue (x, (front, back)) = (front, x :: back)
  fun dequeue ([], back) = dequeue (rev back, [])
    | dequeue (x :: front, back) = (x, (front, back))
end

val q0 = Queue.empty
val q1 = Queue.enqueue (1, q0)
val q2 = Queue.enqueue (2, q1)
val q3 = Queue.enqueue (3, q2)
val (v1, q4) = Queue.dequeue q3
val (v2, q5) = Queue.dequeue q4
val () = print (Int.toString v1 ^ "\n")
val () = print (Int.toString v2 ^ "\n")

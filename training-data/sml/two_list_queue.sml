(* Functional queue with front and back lists: amortized O(1) *)
structure Queue =
struct
  type 'a queue = 'a list * 'a list

  val empty : 'a queue = ([], [])

  fun isEmpty ([], []) = true
    | isEmpty _ = false

  fun enqueue (x, (f, b)) = (f, x :: b)

  fun dequeue ([], []) = NONE
    | dequeue ([], b) = dequeue (rev b, [])
    | dequeue (x :: f, b) = SOME (x, (f, b))
end

val q = Queue.enqueue (3, Queue.enqueue (2, Queue.enqueue (1, Queue.empty)))

fun drain q =
  case Queue.dequeue q of
    NONE => []
  | SOME (x, q') => x :: drain q'

val () = print (String.concatWith " " (map Int.toString (drain q)) ^ "\n")

(* Lazy infinite streams using thunks *)
datatype 'a stream = Nil | Cons of 'a * (unit -> 'a stream)

fun from n = Cons (n, fn () => from (n + 1))

fun take (0, _) = []
  | take (_, Nil) = []
  | take (n, Cons (x, rest)) = x :: take (n - 1, rest ())

fun smap f Nil = Nil
  | smap f (Cons (x, rest)) = Cons (f x, fn () => smap f (rest ()))

fun sfilter p Nil = Nil
  | sfilter p (Cons (x, rest)) =
      if p x then Cons (x, fn () => sfilter p (rest ()))
      else sfilter p (rest ())

val evens = sfilter (fn x => x mod 2 = 0) (from 1)
val squares = smap (fn x => x * x) evens

val () = print (String.concatWith " " (map Int.toString (take (5, squares))) ^ "\n")

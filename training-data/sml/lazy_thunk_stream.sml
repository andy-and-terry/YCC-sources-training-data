(* Lazy streams from thunks: a stream is a head and a suspended tail. *)
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

fun sieve (Cons (p, rest)) =
      Cons (p, fn () => sieve (sfilter (fn n => n mod p <> 0) (rest ())))
  | sieve Nil = Nil

fun show l = print (String.concatWith " " (map Int.toString l) ^ "\n")

val () = show (take (5, from 1))
val () = show (take (5, smap (fn x => x * x) (from 1)))
val () = show (take (4, sfilter (fn x => x mod 7 = 0) (from 1)))
val () = show (take (10, sieve (from 2)))

fun fibs () =
  let fun go (a, b) = Cons (a, fn () => go (b, a + b))
  in go (0, 1) end
val () = show (take (12, fibs ()))

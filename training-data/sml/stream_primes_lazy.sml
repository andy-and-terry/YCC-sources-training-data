datatype 'a stream = Nil | Cons of 'a * (unit -> 'a stream)

fun from n = Cons (n, fn () => from (n + 1))

fun filterS p Nil = Nil
  | filterS p (Cons (x, t)) =
      if p x then Cons (x, fn () => filterS p (t ()))
      else filterS p (t ())

fun sieve Nil = Nil
  | sieve (Cons (p, t)) =
      Cons (p, fn () => sieve (filterS (fn x => x mod p <> 0) (t ())))

fun take (0, _) = []
  | take (_, Nil) = []
  | take (n, Cons (x, t)) = x :: take (n - 1, t ())

val () = print (String.concatWith " " (map Int.toString (take (10, sieve (from 2)))) ^ "\n")

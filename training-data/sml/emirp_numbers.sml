(* Emirps: primes whose digit reversal is a different prime. *)
fun isPrime n =
  let fun go i = i * i > n orelse (n mod i <> 0 andalso go (i + 1))
  in n >= 2 andalso go 2 end

fun reverseDigits n =
  let fun go 0 acc = acc
        | go m acc = go (m div 10) (acc * 10 + m mod 10)
  in go n 0 end

fun emirps n =
  if n >= 100 then []
  else
    let val r = reverseDigits n
        val rest = emirps (n + 1)
    in if r <> n andalso isPrime n andalso isPrime r then n :: rest else rest end

val () = print (String.concatWith " " (map Int.toString (emirps 2)) ^ "\n")

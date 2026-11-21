(* Carmichael numbers: composite n where a^(n-1) = 1 (mod n) for all a coprime to n. *)
fun gcd (a, 0) = a
  | gcd (a, b) = gcd (b, a mod b)

fun powMod (b, e, m) =
  let
    fun go (b, 0, r) = r
      | go (b, e, r) =
          go (b * b mod m, e div 2, if e mod 2 = 1 then r * b mod m else r)
  in go (b mod m, e, 1) end

fun isPrime n =
  let fun go p = p * p > n orelse (n mod p <> 0 andalso go (p + 1))
  in n > 1 andalso go 2 end

fun isCarmichael n =
  let fun ok a = a >= n orelse ((gcd (a, n) <> 1 orelse powMod (a, n - 1, n) = 1) andalso ok (a + 1))
  in not (isPrime n) andalso ok 2 end

fun loop n =
  if n >= 3000 then ()
  else (if isCarmichael n then print (Int.toString n ^ " ") else (); loop (n + 2))

val () = (loop 3; print "\n")

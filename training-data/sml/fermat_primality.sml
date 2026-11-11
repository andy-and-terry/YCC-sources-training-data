(* Fermat primality test; Carmichael number 561 fools it. *)
fun powmod _ 0 m = 1 mod m
  | powmod b e m =
      let
        val half = powmod b (e div 2) m
        val sq = half * half mod m
      in if e mod 2 = 0 then sq else sq * b mod m end

fun probablyPrime n = n > 2 andalso powmod 2 (n - 1) n = 1

val () = app (fn n => print (Int.toString n ^ " " ^ Bool.toString (probablyPrime n) ^ "\n")) [97, 91, 561]

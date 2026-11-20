(* Goldbach pair returning an option. *)
fun isPrime n =
  n > 1 andalso let fun go d = d * d > n orelse (n mod d <> 0 andalso go (d + 1)) in go 2 end
fun goldbach n =
  let fun go p = if p > n div 2 then NONE
                 else if isPrime p andalso isPrime (n - p) then SOME (p, n - p)
                 else go (p + 1)
  in go 2 end
val _ = case goldbach 28 of SOME (a, b) => print (Int.toString a ^ " + " ^ Int.toString b ^ "\n") | NONE => ()

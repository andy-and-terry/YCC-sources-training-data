(* Amicable pairs below 1500 via sums of proper divisors. *)
fun s n =
  let
    fun go (d, acc) = if d >= n then acc else go (d + 1, if n mod d = 0 then acc + d else acc)
  in go (1, 0) end

fun loop a =
  if a >= 1500 then ()
  else
    let val b = s a
    in
      (if b > a andalso s b = a
       then print (Int.toString a ^ " " ^ Int.toString b ^ "\n")
       else ());
      loop (a + 1)
    end

val () = loop 2

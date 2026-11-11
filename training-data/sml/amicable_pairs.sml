(* Amicable pairs: d(a) = b and d(b) = a with a <> b. *)
fun d n =
  let
    fun go i s = if i >= n then s else go (i + 1) (if n mod i = 0 then s + i else s)
  in go 1 0 end

fun loop a =
  if a >= 1500 then ()
  else
    let val b = d a
    in
      (if b > a andalso d b = a
       then print (Int.toString a ^ " " ^ Int.toString b ^ "\n")
       else ());
      loop (a + 1)
    end

val () = loop 2

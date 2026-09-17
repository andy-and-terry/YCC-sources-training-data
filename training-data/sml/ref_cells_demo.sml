val counter = ref 0

fun next () =
  (counter := !counter + 1; !counter)

val a = next ()
val b = next ()
val c = next ()

val () = print (String.concatWith " " (map Int.toString [a, b, c]) ^ "\n")

fun make_accumulator init =
  let
    val total = ref init
  in
    fn x => (total := !total + x; !total)
  end

val acc = make_accumulator 10
val () = print (Int.toString (acc 5) ^ "\n")
val () = print (Int.toString (acc 20) ^ "\n")
val () = print (Int.toString (!counter) ^ "\n")

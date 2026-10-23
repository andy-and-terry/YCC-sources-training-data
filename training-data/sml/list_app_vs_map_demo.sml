val log = ref ([] : string list)

fun visit x =
  (log := ("saw " ^ Int.toString x) :: !log; x * 2)

val doubled = map visit [1, 2, 3]
val () = print (String.concatWith "," (map Int.toString doubled) ^ "\n")
val () = print (String.concatWith "; " (rev (!log)) ^ "\n")

val () = app (fn x => print (Int.toString x ^ " ")) [4, 5, 6]
val () = print "\n"

val () = ListPair.app (fn (a, b) => print (a ^ "=" ^ Int.toString b ^ " ")) (["x", "y"], [1, 2])
val () = print "\n"

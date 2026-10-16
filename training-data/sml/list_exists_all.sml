val nums = [2, 4, 6, 8, 11]

val allEven = List.all (fn x => x mod 2 = 0) nums
val someOdd = List.exists (fn x => x mod 2 = 1) nums
val firstBig = List.find (fn x => x > 5) nums

val () = print (Bool.toString allEven ^ "\n")
val () = print (Bool.toString someOdd ^ "\n")
val () = print (case firstBig of SOME x => Int.toString x | NONE => "none")
val () = print "\n"

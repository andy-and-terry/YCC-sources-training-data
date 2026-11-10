fun pieces cuts = (cuts * cuts + cuts + 2) div 2

val () = print (String.concatWith " " (List.tabulate (10, fn n => Int.toString (pieces n))) ^ "\n")
(* 1 2 4 7 11 16 22 29 37 46 *)

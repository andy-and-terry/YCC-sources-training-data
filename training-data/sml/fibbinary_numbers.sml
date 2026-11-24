(* Fibbinary numbers: no two adjacent 1 bits. *)
fun isFibbinary n = Word.andb (Word.fromInt n, Word.>> (Word.fromInt n, 0w1)) = 0w0

val () =
  print (String.concatWith " "
    (map Int.toString (List.filter isFibbinary (List.tabulate (50, fn i => i)))) ^ "\n")

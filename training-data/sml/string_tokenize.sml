(* Splitting strings with String.tokens and String.fields *)
val line = "alpha, beta,,gamma"

val toks = String.tokens (fn c => c = #"," orelse c = #" ") line
val flds = String.fields (fn c => c = #",") line

fun show xs = print ("[" ^ String.concatWith "|" xs ^ "]\n")

val () = show toks
val () = show flds
val () = print (Int.toString (length toks) ^ " tokens, " ^ Int.toString (length flds) ^ " fields\n")

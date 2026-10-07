val line = "name,age,,city"

val fields = String.fields (fn c => c = #",") line
val tokens = String.tokens (fn c => c = #",") line
val () = print (Int.toString (length fields) ^ " " ^ Int.toString (length tokens) ^ "\n")
val () = print (String.concatWith "|" fields ^ "\n")
val () = print (String.concatWith "|" tokens ^ "\n")

val words = String.tokens Char.isSpace "  the   quick brown\tfox \n"
val () = print (String.concatWith "_" words ^ "\n")

val () = print (Int.toString (length words) ^ "\n")

val parse_kv = fn s =>
  case String.fields (fn c => c = #"=") s of
    [k, v] => SOME (k, v)
  | _ => NONE

val () = List.app (fn s =>
  print (case parse_kv s of
           SOME (k, v) => k ^ " -> " ^ v ^ "\n"
         | NONE => "invalid: " ^ s ^ "\n"))
  ["a=1", "b=2=3", "novalue"]

val () = print (String.concatWith ", " (rev words) ^ "\n")
val () = print (Bool.toString (String.isPrefix "qu" "quick") ^ " ")
val () = print (Bool.toString (String.isSuffix "ck" "quick") ^ " ")
val () = print (Bool.toString (String.isSubstring "ic" "quick") ^ "\n")
val () = print (String.substring ("abcdef", 2, 3) ^ " " ^ String.extract ("abcdef", 4, NONE) ^ "\n")
val () = print (String.translate (fn c => if c = #"a" then "AA" else str c) "banana" ^ "\n")
val () = print (implode (rev (explode "stressed")) ^ "\n")

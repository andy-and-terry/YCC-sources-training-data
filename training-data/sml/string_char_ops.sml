val s = "Hello, Standard ML"

val () = print (Int.toString (String.size s) ^ "\n")
val () = print (String.map Char.toUpper s ^ "\n")
val () = print (implode (rev (explode s)) ^ "\n")

val words = String.tokens (fn c => c = #" " orelse c = #",") s
val () = print (String.concatWith "|" words ^ "\n")

val fields = String.fields (fn c => c = #",") "a,,b,c"
val () = print (Int.toString (length fields) ^ "\n")

val vowels = List.filter (fn c => Char.contains "aeiouAEIOU" c) (explode s)
val () = print (Int.toString (length vowels) ^ "\n")

val () = print (String.substring (s, 7, 8) ^ "\n")
val () = print (Bool.toString (String.isPrefix "Hello" s) ^ "\n")
val () = print (Bool.toString (String.isSubstring "ML" s) ^ "\n")
val () = print (String.translate (fn #"l" => "L" | c => str c) s ^ "\n")

fun capitalize "" = ""
  | capitalize w = str (Char.toUpper (String.sub (w, 0))) ^ String.extract (w, 1, NONE)

val () = print (String.concatWith " " (map capitalize ["the", "quick", "fox"]) ^ "\n")
val () = print (Int.toString (Char.ord #"A") ^ " " ^ str (Char.chr 98) ^ "\n")
val () = print (case Int.fromString "42abc" of SOME n => Int.toString n | NONE => "none")
val () = print "\n"

fun show l = "[" ^ String.concatWith "|" l ^ "]"

val () = print (show (String.tokens Char.isSpace "  the quick  brown fox ") ^ "\n")
val () = print (show (String.fields (fn c => c = #",") "a,b,,c") ^ "\n")
val () = print (show (String.tokens (fn c => c = #",") "a,b,,c") ^ "\n")
val () = print (String.implode (rev (String.explode "stressed")) ^ "\n")
val () = print (String.map Char.toUpper "shout" ^ "\n")
val () = print (String.substring ("abcdef", 2, 3) ^ "\n")
val () = print (Bool.toString (String.isPrefix "ab" "abc") ^ " ")
val () = print (Bool.toString (String.isSubstring "ack" "racket") ^ "\n")
val () = print (String.translate (fn #"a" => "4" | #"e" => "3" | c => str c) "leet speak" ^ "\n")
val () = print (Int.toString (size "hello") ^ " " ^ str (String.sub ("hello", 1)) ^ "\n")
val () = print (case Int.fromString "42abc" of SOME n => Int.toString n | NONE => "bad")
val () = print "\n"
val () = print (String.concat ["a", "b", "c"] ^ " " ^ Bool.toString (String.compare ("a", "b") = LESS) ^ "\n")

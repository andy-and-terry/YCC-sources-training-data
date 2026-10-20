val s = "Hello, World"
val _ = print (Int.toString (size s) ^ " " ^ String.map Char.toUpper s ^ " " ^ String.substring (s, 7, 5) ^ "\n")
val _ = print (implode (rev (explode s)) ^ "\n")
val _ = print (String.concatWith "|" (String.tokens (fn c => c = #",") "a,b,,c") ^ "\n")
val _ = print (String.concatWith "|" (String.fields (fn c => c = #",") "a,b,,c") ^ "\n")
val _ = print (Bool.toString (String.isPrefix "Hel" s) ^ Bool.toString (String.isSubstring "World" s) ^ Bool.toString (String.isSuffix "ld" s) ^ "\n")
val _ = print (String.translate (fn c => if c = #"l" then "L" else str c) s ^ "\n")
val _ = print (Int.toString (Char.ord #"A") ^ Char.toString (Char.chr 98) ^ Bool.toString (Char.isDigit #"7") ^ "\n")
val _ = print (Int.toString (valOf (Int.fromString "123")) ^ " " ^ Real.toString (valOf (Real.fromString "2.5")) ^ "\n")
val _ = print (Real.fmt (StringCvt.FIX (SOME 3)) 3.14159 ^ " " ^ Int.fmt StringCvt.HEX 255 ^ " " ^ Int.fmt StringCvt.BIN 5 ^ "\n")
val _ = print (String.str #"x" ^ String.extract (s, 7, NONE) ^ String.concat ["a", "b"] ^ "\n")
val _ = print (Bool.toString (String.< ("apple", "banana")) ^ Bool.toString (String.compare ("a", "a") = EQUAL) ^ "\n")
val ss = Substring.full s
val _ = print (Substring.string (Substring.dropl Char.isAlpha ss) ^ "\n")

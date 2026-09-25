fun collatzSteps 1 = 0
  | collatzSteps n = 1 + collatzSteps (if n mod 2 = 0 then n div 2 else 3 * n + 1)

fun collatzSequence 1 = [1]
  | collatzSequence n = n :: collatzSequence (if n mod 2 = 0 then n div 2 else 3 * n + 1)

val () = print (String.concatWith " " (map Int.toString (collatzSequence 27)) ^ "\n")
val () = print ("steps: " ^ Int.toString (collatzSteps 27) ^ "\n")

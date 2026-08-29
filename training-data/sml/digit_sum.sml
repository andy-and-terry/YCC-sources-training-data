fun digit_sum n = if n < 10 then n else n mod 10 + digit_sum (n div 10)

val () = print (Int.toString (digit_sum 12345) ^ "\n")

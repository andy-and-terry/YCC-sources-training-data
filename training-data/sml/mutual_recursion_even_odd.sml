fun isEven 0 = true
  | isEven n = isOdd (n - 1)
and isOdd 0 = false
  | isOdd n = isEven (n - 1)

val _ = print (Bool.toString (isEven 10) ^ " " ^ Bool.toString (isOdd 7) ^ "\n")

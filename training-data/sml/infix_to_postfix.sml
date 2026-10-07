fun isOperator t = t = "+" orelse t = "-" orelse t = "*" orelse t = "/"

fun precedence "+" = 1
  | precedence "-" = 1
  | precedence "*" = 2
  | precedence "/" = 2
  | precedence _ = 0

fun popUntilParen (output, "(" :: ops) = (output, ops)
  | popUntilParen (output, op1 :: ops) = popUntilParen (op1 :: output, ops)
  | popUntilParen (_, []) = raise Fail "mismatched parentheses"

fun popHigher (output, op1 :: ops, t) =
      if isOperator op1 andalso precedence op1 >= precedence t then
        popHigher (op1 :: output, ops, t)
      else (output, op1 :: ops)
  | popHigher (output, [], _) = (output, [])

fun toPostfix tokens =
  let
    fun loop ([], output, ops) = rev output @ ops
      | loop ("(" :: rest, output, ops) = loop (rest, output, "(" :: ops)
      | loop (")" :: rest, output, ops) =
          let val (output', ops') = popUntilParen (output, ops) in loop (rest, output', ops') end
      | loop (t :: rest, output, ops) =
          if isOperator t then
            let val (output', ops') = popHigher (output, ops, t) in loop (rest, output', t :: ops') end
          else loop (rest, t :: output, ops)
  in
    loop (tokens, [], [])
  end

val () = print (String.concatWith " " (toPostfix ["3", "+", "4", "*", "2"]) ^ "\n")
val () = print (String.concatWith " " (toPostfix ["(", "1", "+", "2", ")", "*", "3"]) ^ "\n")

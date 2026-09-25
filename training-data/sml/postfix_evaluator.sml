fun isOperator t = t = "+" orelse t = "-" orelse t = "*" orelse t = "/"

fun applyOp (a, b, "+") = a + b
  | applyOp (a, b, "-") = a - b
  | applyOp (a, b, "*") = a * b
  | applyOp (a, b, "/") = a div b
  | applyOp (_, _, _) = raise Fail "unknown operator"

fun evalPostfix tokens =
  let
    fun loop ([], [result]) = result
      | loop ([], _) = raise Fail "invalid expression"
      | loop (t :: rest, stack) =
          if isOperator t then
            case stack of
              b :: a :: stack' => loop (rest, applyOp (a, b, t) :: stack')
            | _ => raise Fail "invalid expression"
          else
            loop (rest, valOf (Int.fromString t) :: stack)
  in
    loop (tokens, [])
  end

val () = print (Int.toString (evalPostfix ["3", "4", "+", "2", "*"]) ^ "\n")
val () = print (Int.toString (evalPostfix ["5", "1", "2", "+", "4", "*", "+", "3", "-"]) ^ "\n")

module RpnCalculator exposing (evaluate)


evaluate : String -> Result String Float
evaluate input =
    input
        |> String.words
        |> List.foldl step (Ok [])
        |> Result.andThen
            (\stack ->
                case stack of
                    [ x ] ->
                        Ok x

                    _ ->
                        Err "malformed expression"
            )


step : String -> Result String (List Float) -> Result String (List Float)
step token acc =
    case ( acc, token ) of
        ( Err e, _ ) ->
            Err e

        ( Ok (b :: a :: rest), "+" ) ->
            Ok (a + b :: rest)

        ( Ok (b :: a :: rest), "-" ) ->
            Ok (a - b :: rest)

        ( Ok (b :: a :: rest), "*" ) ->
            Ok (a * b :: rest)

        ( Ok (b :: a :: rest), "/" ) ->
            if b == 0 then
                Err "division by zero"

            else
                Ok (a / b :: rest)

        ( Ok stack, _ ) ->
            case String.toFloat token of
                Just n ->
                    Ok (n :: stack)

                Nothing ->
                    Err ("bad token: " ++ token)

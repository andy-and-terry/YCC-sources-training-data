module LychrelSteps exposing (steps, results)

{-| Reverse-and-add until a palindrome; count the steps.
-}


rev : Int -> Int
rev n =
    String.fromInt n
        |> String.reverse
        |> String.toInt
        |> Maybe.withDefault 0


steps : Int -> Int
steps start =
    stepsHelp start 0


stepsHelp : Int -> Int -> Int
stepsHelp n count =
    if count > 0 && n == rev n then
        count

    else if count >= 50 then
        -1

    else
        stepsHelp (n + rev n) (count + 1)


results : List Int
results =
    List.map steps [ 56, 57, 59, 79, 89 ]



-- results == [ 1, 2, 3, 6, 24 ]

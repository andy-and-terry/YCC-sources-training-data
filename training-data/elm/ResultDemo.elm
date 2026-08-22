module ResultDemo exposing (safeDivide)


safeDivide : Int -> Int -> Result String Int
safeDivide a b =
    if b == 0 then
        Err "division by zero"

    else
        Ok (a // b)


combined : Int -> Int -> Int -> Result String Int
combined a b c =
    safeDivide a b
        |> Result.andThen (\x -> safeDivide x c)

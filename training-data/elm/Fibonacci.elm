module Fibonacci exposing (fibonacci)


fibonacci : Int -> List Int
fibonacci n =
    let
        go count a b acc =
            if count == 0 then
                List.reverse acc

            else
                go (count - 1) b (a + b) (a :: acc)
    in
    go n 0 1 []

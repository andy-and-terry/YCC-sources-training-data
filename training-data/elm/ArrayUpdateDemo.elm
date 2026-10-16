module ArrayUpdateDemo exposing (swap, incrementAt)

import Array exposing (Array)


incrementAt : Int -> Array Int -> Array Int
incrementAt i arr =
    case Array.get i arr of
        Just v ->
            Array.set i (v + 1) arr

        Nothing ->
            arr


swap : Int -> Int -> Array a -> Array a
swap i j arr =
    case ( Array.get i arr, Array.get j arr ) of
        ( Just a, Just b ) ->
            arr
                |> Array.set i b
                |> Array.set j a

        _ ->
            arr

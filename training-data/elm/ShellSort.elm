module ShellSort exposing (shellSort)

import Array exposing (Array)


shellSort : List comparable -> List comparable
shellSort items =
    let
        arr =
            Array.fromList items

        n =
            Array.length arr
    in
    Array.toList (List.foldl (gapPass n) arr (initialGaps n))


initialGaps : Int -> List Int
initialGaps n =
    List.reverse (gapsHelper (n // 2) [])


gapsHelper : Int -> List Int -> List Int
gapsHelper gap acc =
    if gap <= 0 then
        acc

    else
        gapsHelper (gap // 2) (gap :: acc)


gapPass : Int -> Int -> Array comparable -> Array comparable
gapPass n gap arr =
    List.foldl (insertAtGap gap) arr (List.range gap (n - 1))


insertAtGap : Int -> Int -> Array comparable -> Array comparable
insertAtGap gap i arr =
    case Array.get i arr of
        Nothing ->
            arr

        Just temp ->
            shiftBack gap i temp arr


shiftBack : Int -> Int -> comparable -> Array comparable -> Array comparable
shiftBack gap j temp arr =
    if j >= gap then
        case Array.get (j - gap) arr of
            Just prev ->
                if prev > temp then
                    shiftBack gap (j - gap) temp (Array.set j prev arr)

                else
                    Array.set j temp arr

            Nothing ->
                Array.set j temp arr

    else
        Array.set j temp arr

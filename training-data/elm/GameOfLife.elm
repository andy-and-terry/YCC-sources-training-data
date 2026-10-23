module GameOfLife exposing (main, step, glider)

import Html exposing (Html, pre, text)
import Set exposing (Set)


type alias Cell =
    ( Int, Int )


glider : Set Cell
glider =
    Set.fromList [ ( 0, 1 ), ( 1, 2 ), ( 2, 0 ), ( 2, 1 ), ( 2, 2 ) ]


neighbors : Cell -> List Cell
neighbors ( r, c ) =
    List.concatMap
        (\dr -> List.filterMap (\dc -> if dr == 0 && dc == 0 then Nothing else Just ( r + dr, c + dc )) [ -1, 0, 1 ])
        [ -1, 0, 1 ]


liveNeighbors : Set Cell -> Cell -> Int
liveNeighbors alive cell =
    neighbors cell |> List.filter (\n -> Set.member n alive) |> List.length


step : Set Cell -> Set Cell
step alive =
    let
        candidates =
            Set.toList alive |> List.concatMap (\cell -> cell :: neighbors cell) |> Set.fromList

        survives cell =
            case ( Set.member cell alive, liveNeighbors alive cell ) of
                ( True, n ) ->
                    n == 2 || n == 3

                ( False, n ) ->
                    n == 3
    in
    Set.filter survives candidates


render : Set Cell -> String
render alive =
    List.range 0 4
        |> List.map (\r -> List.range 0 4 |> List.map (\c -> if Set.member ( r, c ) alive then "#" else ".") |> String.concat)
        |> String.join "\n"


main : Html msg
main =
    let
        generations =
            List.foldl (\_ acc -> step (Maybe.withDefault glider (List.head acc)) :: acc) [ glider ] (List.range 1 3)
                |> List.reverse
    in
    pre [] [ text (String.join "\n\n" (List.map render generations)) ]

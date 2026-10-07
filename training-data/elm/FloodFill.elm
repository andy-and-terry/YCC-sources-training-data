module FloodFill exposing (fill)

import Dict exposing (Dict)


type alias Grid =
    Dict ( Int, Int ) Int


fill : ( Int, Int ) -> Int -> Grid -> Grid
fill start color grid =
    case Dict.get start grid of
        Nothing ->
            grid

        Just original ->
            if original == color then
                grid

            else
                fillHelp original color [ start ] grid


fillHelp : Int -> Int -> List ( Int, Int ) -> Grid -> Grid
fillHelp original color stack grid =
    case stack of
        [] ->
            grid

        ( r, c ) :: rest ->
            if Dict.get ( r, c ) grid == Just original then
                fillHelp original
                    color
                    ([ ( r + 1, c ), ( r - 1, c ), ( r, c + 1 ), ( r, c - 1 ) ] ++ rest)
                    (Dict.insert ( r, c ) color grid)

            else
                fillHelp original color rest grid

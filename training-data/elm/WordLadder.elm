module WordLadder exposing (ladderLength)

import Set exposing (Set)


oneLetterDiff : String -> String -> Bool
oneLetterDiff a b =
    List.map2 Tuple.pair (String.toList a) (String.toList b)
        |> List.filter (\( x, y ) -> x /= y)
        |> List.length
        |> (==) 1


ladderLength : String -> String -> Set String -> Int
ladderLength start target wordSet =
    bfs [ ( start, 1 ) ] (Set.remove start wordSet) target


bfs : List ( String, Int ) -> Set String -> String -> Int
bfs queue remaining target =
    case queue of
        [] ->
            0

        ( word, steps ) :: rest ->
            if word == target then
                steps

            else
                let
                    neighbors =
                        Set.filter (oneLetterDiff word) remaining

                    newRemaining =
                        Set.diff remaining neighbors

                    newQueue =
                        rest ++ List.map (\w -> ( w, steps + 1 )) (Set.toList neighbors)
                in
                bfs newQueue newRemaining target

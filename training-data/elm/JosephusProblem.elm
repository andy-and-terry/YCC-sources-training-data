module JosephusProblem exposing (eliminationOrder, main, survivor)

import Html exposing (Html, text)


{-| Order in which people are eliminated when every k-th one is removed.
-}
eliminationOrder : Int -> Int -> List Int
eliminationOrder n k =
    let
        go people index acc =
            case people of
                [] ->
                    List.reverse acc

                _ ->
                    let
                        i =
                            modBy (List.length people) (index + k - 1)

                        removed =
                            List.take 1 (List.drop i people)

                        rest =
                            List.take i people ++ List.drop (i + 1) people
                    in
                    go rest i (List.reverse removed ++ acc)
    in
    go (List.range 1 n) 0 []


survivor : Int -> Int -> Int
survivor n k =
    List.range 2 n
        |> List.foldl (\i acc -> modBy i (acc + k)) 0
        |> (+) 1


main : Html msg
main =
    text
        ("order: "
            ++ String.join " " (List.map String.fromInt (eliminationOrder 7 3))
            ++ "; survivor: "
            ++ String.fromInt (survivor 7 3)
        )

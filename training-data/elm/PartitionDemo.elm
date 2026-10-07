module PartitionDemo exposing (evensAndOdds, splitAtFirstNegative, wordsByLength)


evensAndOdds : List Int -> ( List Int, List Int )
evensAndOdds =
    List.partition (\n -> modBy 2 n == 0)


splitAtFirstNegative : List Int -> ( List Int, List Int )
splitAtFirstNegative numbers =
    let
        prefix =
            takeWhileNonNegative numbers
    in
    ( prefix, List.drop (List.length prefix) numbers )


takeWhileNonNegative : List Int -> List Int
takeWhileNonNegative numbers =
    case numbers of
        n :: rest ->
            if n >= 0 then
                n :: takeWhileNonNegative rest

            else
                []

        [] ->
            []


wordsByLength : Int -> List String -> ( List String, List String )
wordsByLength limit =
    List.partition (\w -> String.length w <= limit)

module FoldDemo exposing (countIf, maximumOr, reverseList, sumOfSquares)


sumOfSquares : List Int -> Int
sumOfSquares =
    List.foldl (\n acc -> acc + n * n) 0


reverseList : List a -> List a
reverseList =
    List.foldl (::) []


countIf : (a -> Bool) -> List a -> Int
countIf predicate =
    List.foldl
        (\x acc ->
            if predicate x then
                acc + 1

            else
                acc
        )
        0


maximumOr : Int -> List Int -> Int
maximumOr default list =
    case list of
        [] ->
            default

        x :: xs ->
            List.foldl max x xs

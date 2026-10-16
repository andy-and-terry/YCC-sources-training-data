module AccumulatorRecursion exposing (lengthTR, reverseTR, sumTR)


sumTR : List Int -> Int
sumTR list =
    sumHelp list 0


sumHelp : List Int -> Int -> Int
sumHelp list acc =
    case list of
        [] ->
            acc

        x :: rest ->
            sumHelp rest (acc + x)


lengthTR : List a -> Int
lengthTR list =
    List.foldl (\_ n -> n + 1) 0 list


reverseTR : List a -> List a
reverseTR list =
    List.foldl (::) [] list

module FoldDirectionDemo exposing (leftOrder, reverseList, rightOrder)


leftOrder : List String -> String
leftOrder =
    List.foldl (\x acc -> acc ++ x) ""


rightOrder : List String -> String
rightOrder =
    List.foldr (\x acc -> acc ++ x) ""


reverseList : List a -> List a
reverseList =
    List.foldl (::) []

module IteratorPattern exposing (Iterator, fromList, hasNext, next, toList)

{-| The Gang-of-Four Iterator pattern needs no separate iterator interface
in Elm: an iterator is just the remaining items, and "advancing" it is a
plain function returning the next item alongside the iterator that
remains, matching the shape of `List.head`/`List.tail` combined.
-}


type Iterator a
    = Iterator (List a)


fromList : List a -> Iterator a
fromList items =
    Iterator items


hasNext : Iterator a -> Bool
hasNext (Iterator items) =
    not (List.isEmpty items)


next : Iterator a -> Maybe ( a, Iterator a )
next (Iterator items) =
    case items of
        [] ->
            Nothing

        item :: rest ->
            Just ( item, Iterator rest )


toList : Iterator a -> List a
toList iterator =
    case next iterator of
        Nothing ->
            []

        Just ( item, rest ) ->
            item :: toList rest

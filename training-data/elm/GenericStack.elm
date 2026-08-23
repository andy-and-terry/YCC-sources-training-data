module GenericStack exposing (Stack, empty, isEmpty, pop, push)


type alias Stack a =
    List a


empty : Stack a
empty =
    []


push : a -> Stack a -> Stack a
push item stack =
    item :: stack


pop : Stack a -> Maybe ( a, Stack a )
pop stack =
    case stack of
        [] ->
            Nothing

        h :: t ->
            Just ( h, t )


isEmpty : Stack a -> Bool
isEmpty stack =
    List.isEmpty stack

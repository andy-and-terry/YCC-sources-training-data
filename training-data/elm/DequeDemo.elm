module DequeDemo exposing (Deque, empty, pushBack, pushFront, popBack, popFront, toList)


type alias Deque a =
    { front : List a
    , back : List a
    }


empty : Deque a
empty =
    { front = [], back = [] }


pushFront : a -> Deque a -> Deque a
pushFront item deque =
    { deque | front = item :: deque.front }


pushBack : a -> Deque a -> Deque a
pushBack item deque =
    { deque | back = item :: deque.back }


popFront : Deque a -> ( Maybe a, Deque a )
popFront deque =
    case deque.front of
        item :: rest ->
            ( Just item, { deque | front = rest } )

        [] ->
            case List.reverse deque.back of
                item :: rest ->
                    ( Just item, { front = rest, back = [] } )

                [] ->
                    ( Nothing, deque )


popBack : Deque a -> ( Maybe a, Deque a )
popBack deque =
    case deque.back of
        item :: rest ->
            ( Just item, { deque | back = rest } )

        [] ->
            case List.reverse deque.front of
                item :: rest ->
                    ( Just item, { front = [], back = rest } )

                [] ->
                    ( Nothing, deque )


toList : Deque a -> List a
toList deque =
    deque.front ++ List.reverse deque.back

module GenericQueue exposing (Queue, dequeue, empty, enqueue)


type alias Queue a =
    { front : List a, back : List a }


empty : Queue a
empty =
    { front = [], back = [] }


enqueue : a -> Queue a -> Queue a
enqueue item queue =
    { queue | back = item :: queue.back }


dequeue : Queue a -> Maybe ( a, Queue a )
dequeue queue =
    case queue.front of
        h :: t ->
            Just ( h, { queue | front = t } )

        [] ->
            case List.reverse queue.back of
                [] ->
                    Nothing

                h :: t ->
                    Just ( h, { front = t, back = [] } )

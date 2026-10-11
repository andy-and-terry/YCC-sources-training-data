module QueueTwoLists exposing (Queue, empty, enqueue, dequeue)


type Queue a
    = Queue (List a) (List a)


empty : Queue a
empty =
    Queue [] []


enqueue : a -> Queue a -> Queue a
enqueue x (Queue front back) =
    Queue front (x :: back)


dequeue : Queue a -> Maybe ( a, Queue a )
dequeue (Queue front back) =
    case front of
        x :: rest ->
            Just ( x, Queue rest back )

        [] ->
            case List.reverse back of
                [] ->
                    Nothing

                x :: rest ->
                    Just ( x, Queue rest [] )

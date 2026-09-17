module CircularBuffer exposing (Buffer, empty, push, toList)

import Array exposing (Array)


type alias Buffer =
    { data : Array (Maybe Int)
    , capacity : Int
    , start : Int
    , size : Int
    }


empty : Int -> Buffer
empty capacity =
    { data = Array.repeat capacity Nothing
    , capacity = capacity
    , start = 0
    , size = 0
    }


push : Int -> Buffer -> Buffer
push value buffer =
    let
        index =
            modBy buffer.capacity (buffer.start + buffer.size)

        newData =
            Array.set index (Just value) buffer.data
    in
    if buffer.size < buffer.capacity then
        { buffer | data = newData, size = buffer.size + 1 }

    else
        { buffer | data = newData, start = modBy buffer.capacity (buffer.start + 1) }


toList : Buffer -> List Int
toList buffer =
    List.range 0 (buffer.size - 1)
        |> List.filterMap
            (\i ->
                Array.get (modBy buffer.capacity (buffer.start + i)) buffer.data
                    |> Maybe.andThen identity
            )

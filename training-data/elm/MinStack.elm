module MinStack exposing (Stack, empty, min, pop, push)


type alias Stack =
    { values : List Int
    , mins : List Int
    }


empty : Stack
empty =
    { values = [], mins = [] }


push : Int -> Stack -> Stack
push value stack =
    let
        newMins =
            case stack.mins of
                top :: _ ->
                    if value <= top then
                        value :: stack.mins

                    else
                        stack.mins

                [] ->
                    [ value ]
    in
    { values = value :: stack.values, mins = newMins }


pop : Stack -> Stack
pop stack =
    case ( stack.values, stack.mins ) of
        ( v :: vs, m :: ms ) ->
            if v == m then
                { values = vs, mins = ms }

            else
                { values = vs, mins = stack.mins }

        _ ->
            stack


min : Stack -> Maybe Int
min stack =
    List.head stack.mins

module VanEckSequence exposing (vanEck)


vanEck : Int -> List Int
vanEck count =
    let
        distance x earlier =
            let
                go d ys =
                    case ys of
                        [] ->
                            0

                        y :: rest ->
                            if y == x then
                                d

                            else
                                go (d + 1) rest
            in
            go 1 earlier

        step _ acc =
            case acc of
                x :: earlier ->
                    distance x earlier :: acc

                [] ->
                    acc
    in
    List.reverse (List.foldl step [ 0 ] (List.range 2 count))



-- vanEck 20 == [0,0,1,0,2,0,2,2,1,6,0,5,0,2,6,5,4,0,5,3]

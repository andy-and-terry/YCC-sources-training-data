module ListRotation exposing (rotateLeft, rotateRight)


rotateLeft : Int -> List a -> List a
rotateLeft n list =
    let
        len =
            List.length list
    in
    if len == 0 then
        list

    else
        let
            k =
                modBy len n
        in
        List.drop k list ++ List.take k list


rotateRight : Int -> List a -> List a
rotateRight n list =
    rotateLeft (negate n) list

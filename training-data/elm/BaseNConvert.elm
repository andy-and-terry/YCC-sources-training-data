module BaseNConvert exposing (toBase)


digits : String
digits =
    "0123456789abcdefghijklmnopqrstuvwxyz"


toBase : Int -> Int -> String
toBase base n =
    if n == 0 then
        "0"

    else
        let
            go k acc =
                if k == 0 then
                    acc

                else
                    go (k // base) (String.slice (modBy base k) (modBy base k + 1) digits ++ acc)
        in
        go n ""

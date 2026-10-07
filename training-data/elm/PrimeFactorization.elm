module PrimeFactorization exposing (factorize, isSquareFree)


factorize : Int -> List Int
factorize n =
    factorizeHelp n 2 []


factorizeHelp : Int -> Int -> List Int -> List Int
factorizeHelp n divisor acc =
    if n < 2 then
        List.reverse acc

    else if divisor * divisor > n then
        List.reverse (n :: acc)

    else if modBy divisor n == 0 then
        factorizeHelp (n // divisor) divisor (divisor :: acc)

    else
        factorizeHelp n (divisor + 1) acc


isSquareFree : Int -> Bool
isSquareFree n =
    let
        factors =
            factorize n
    in
    List.length factors == List.length (unique factors)


unique : List Int -> List Int
unique list =
    List.foldr
        (\x acc ->
            if List.member x acc then
                acc

            else
                x :: acc
        )
        []
        list

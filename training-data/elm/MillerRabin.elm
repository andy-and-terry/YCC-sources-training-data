module MillerRabin exposing (isPrime)


modPow : Int -> Int -> Int -> Int
modPow base_ exp modulus =
    modPowHelp (modBy modulus base_) exp modulus 1


modPowHelp : Int -> Int -> Int -> Int -> Int
modPowHelp base_ exp modulus acc =
    if exp <= 0 then
        acc

    else
        let
            acc1 =
                if modBy 2 exp == 1 then
                    modBy modulus (acc * base_)

                else
                    acc

            base1 =
                modBy modulus (base_ * base_)
        in
        modPowHelp base1 (exp // 2) modulus acc1


decompose : Int -> Int -> ( Int, Int )
decompose d r =
    if modBy 2 d == 0 then
        decompose (d // 2) (r + 1)

    else
        ( d, r )


repeatSquare : Int -> Int -> Int -> Bool
repeatSquare x n times =
    if times <= 0 then
        False

    else
        let
            x1 =
                modBy n (x * x)
        in
        if x1 == n - 1 then
            True

        else
            repeatSquare x1 n (times - 1)


isWitness : Int -> Int -> Int -> Int -> Bool
isWitness n d r witness =
    let
        x0 =
            modPow witness d n
    in
    if x0 == 1 || x0 == n - 1 then
        False

    else
        not (repeatSquare x0 n (r - 1))


isPrime : Int -> Bool
isPrime n =
    if n < 2 then
        False

    else if n == 2 || n == 3 then
        True

    else if modBy 2 n == 0 then
        False

    else
        let
            ( d, r ) =
                decompose (n - 1) 0

            witnesses =
                List.filter (\w -> w < n) [ 2, 3, 5, 7, 11, 13 ]
        in
        not (List.any (isWitness n d r) witnesses)

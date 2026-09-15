module RabinKarpSearch exposing (search)


base : Int
base =
    256


modulus : Int
modulus =
    1000000007


search : String -> String -> List Int
search pattern text =
    let
        patternChars =
            String.toList pattern

        textChars =
            String.toList text

        m =
            List.length patternChars

        n =
            List.length textChars
    in
    if m == 0 || m > n then
        []

    else
        let
            patternHash =
                hashOf patternChars

            highOrder =
                power (m - 1)

            firstHash =
                hashOf (List.take m textChars)
        in
        scan textChars patternChars m n highOrder patternHash 0 firstHash []


power : Int -> Int
power k =
    if k <= 0 then
        1

    else
        modBy modulus (base * power (k - 1))


hashOf : List Char -> Int
hashOf chars =
    List.foldl (\c acc -> modBy modulus (acc * base + Char.toCode c)) 0 chars


scan : List Char -> List Char -> Int -> Int -> Int -> Int -> Int -> Int -> List Int -> List Int
scan textChars patternChars m n highOrder patternHash i windowHash acc =
    let
        acc1 =
            if windowHash == patternHash && List.take m (List.drop i textChars) == patternChars then
                acc ++ [ i ]

            else
                acc
    in
    if i + m >= n then
        acc1

    else
        let
            oldChar =
                charAt textChars i

            newChar =
                charAt textChars (i + m)

            rolled =
                modBy modulus (((windowHash - Char.toCode oldChar * highOrder) * base) + Char.toCode newChar)
        in
        scan textChars patternChars m n highOrder patternHash (i + 1) rolled acc1


charAt : List Char -> Int -> Char
charAt chars i =
    chars |> List.drop i |> List.head |> Maybe.withDefault ' '

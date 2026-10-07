module ModularExponentiation exposing (modPow)


modPow : Int -> Int -> Int -> Int
modPow base exponent modulus =
    modPowHelp (modBy modulus base) exponent modulus 1


modPowHelp : Int -> Int -> Int -> Int -> Int
modPowHelp base exponent modulus result =
    if exponent <= 0 then
        result

    else
        let
            newResult =
                if modBy 2 exponent == 1 then
                    modBy modulus (result * base)

                else
                    result
        in
        modPowHelp (modBy modulus (base * base)) (exponent // 2) modulus newResult

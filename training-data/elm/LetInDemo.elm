module LetInDemo exposing (hypotenuse, quadraticRoots)


hypotenuse : Float -> Float -> Float
hypotenuse a b =
    let
        squares =
            a * a + b * b
    in
    sqrt squares


quadraticRoots : Float -> Float -> Float -> Maybe ( Float, Float )
quadraticRoots a b c =
    let
        disc =
            b * b - 4 * a * c

        root sign =
            (-b + sign * sqrt disc) / (2 * a)
    in
    if a == 0 || disc < 0 then
        Nothing

    else
        Just ( root 1, root -1 )

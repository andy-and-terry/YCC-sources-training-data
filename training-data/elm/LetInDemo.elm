module LetInDemo exposing (circleStats, quadraticRoots)


circleStats : Float -> { area : Float, circumference : Float }
circleStats radius =
    let
        pi_ =
            3.14159

        area =
            pi_ * radius * radius

        circumference =
            2 * pi_ * radius
    in
    { area = area, circumference = circumference }


quadraticRoots : Float -> Float -> Float -> Maybe ( Float, Float )
quadraticRoots a b c =
    let
        discriminant =
            b * b - 4 * a * c
    in
    if discriminant < 0 then
        Nothing

    else
        let
            root =
                sqrt discriminant
        in
        Just ( (-b + root) / (2 * a), (-b - root) / (2 * a) )

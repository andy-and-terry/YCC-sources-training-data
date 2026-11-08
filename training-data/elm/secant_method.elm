module SecantMethod exposing (secant)


secant : (Float -> Float) -> Float -> Float -> Float
secant f a b =
    secantHelp f a b 40


secantHelp : (Float -> Float) -> Float -> Float -> Int -> Float
secantHelp f a b n =
    let
        fa =
            f a

        fb =
            f b
    in
    if n == 0 || fa == fb then
        b

    else
        secantHelp f b (b - fb * (b - a) / (fb - fa)) (n - 1)

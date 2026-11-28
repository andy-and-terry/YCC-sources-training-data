module SecantMethod exposing (secant)


secant : (Float -> Float) -> Float -> Float -> Float
secant f x0 x1 =
    secantHelp 50 f x0 x1


secantHelp : Int -> (Float -> Float) -> Float -> Float -> Float
secantHelp n f x0 x1 =
    let
        ( f0, f1 ) =
            ( f x0, f x1 )

        next =
            x1 - f1 * (x1 - x0) / (f1 - f0)
    in
    if n == 0 || f0 == f1 || abs (next - x1) < 1.0e-12 then
        next

    else
        secantHelp (n - 1) f x1 next

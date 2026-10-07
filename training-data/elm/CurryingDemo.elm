module CurryingDemo exposing (addTen, applyTwice, clampPercent, compose3, scaleAll)


add : Int -> Int -> Int
add a b =
    a + b


addTen : Int -> Int
addTen =
    add 10


applyTwice : (a -> a) -> a -> a
applyTwice f x =
    f (f x)


scaleAll : Float -> List Float -> List Float
scaleAll factor =
    List.map ((*) factor)


clampPercent : Int -> Int
clampPercent =
    clamp 0 100


compose3 : (c -> d) -> (b -> c) -> (a -> b) -> a -> d
compose3 f g h =
    f << g << h


-- applyTwice addTen 1 == 21
-- compose3 String.length String.fromInt negate 12345 == 6

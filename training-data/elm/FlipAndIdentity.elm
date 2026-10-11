module FlipAndIdentity exposing (divideBy, subtractFrom, applyTwice)


divideBy : Float -> Float -> Float
divideBy =
    flip (/)


subtractFrom : Int -> Int -> Int
subtractFrom =
    flip (-)


applyTwice : (a -> a) -> a -> a
applyTwice f =
    f >> f


flip : (a -> b -> c) -> b -> a -> c
flip f b a =
    f a b

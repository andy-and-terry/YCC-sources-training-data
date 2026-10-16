module BoolLogicDemo exposing (isLeapYear, xor)


xor : Bool -> Bool -> Bool
xor a b =
    (a || b) && not (a && b)


isLeapYear : Int -> Bool
isLeapYear year =
    (modBy 4 year == 0) && (modBy 100 year /= 0 || modBy 400 year == 0)

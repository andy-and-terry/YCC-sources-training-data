module RecordDemo exposing (Point, addPoints)


type alias Point =
    { x : Float
    , y : Float
    }


addPoints : Point -> Point -> Point
addPoints a b =
    { x = a.x + b.x, y = a.y + b.y }

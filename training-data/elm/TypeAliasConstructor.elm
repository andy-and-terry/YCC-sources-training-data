module TypeAliasConstructor exposing (origin, point)


type alias Point =
    { x : Float
    , y : Float
    }


point : Float -> Float -> Point
point =
    Point


origin : Point
origin =
    point 0 0

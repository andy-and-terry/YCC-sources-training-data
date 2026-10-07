module AdapterPattern exposing (LegacyRectangle, Shape(..), adaptRectangle, area)

{-| The Gang-of-Four Adapter pattern needs no wrapper classes in Elm:
adapting data from one shape into another is just a function that maps a
value of the old type onto a value of the type the rest of the code
expects.
-}


type alias LegacyRectangle =
    { width : Float, height : Float }


type Shape
    = Circle Float
    | Rect Float Float


adaptRectangle : LegacyRectangle -> Shape
adaptRectangle legacy =
    Rect legacy.width legacy.height


area : Shape -> Float
area shape =
    case shape of
        Circle radius ->
            pi * radius * radius

        Rect width height ->
            width * height

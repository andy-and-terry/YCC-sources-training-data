module PhantomTypeDemo exposing (Meters, Feet, addMeters, meters, toFloat_)


type Meters
    = Meters


type Feet
    = Feet


type Length unit
    = Length Float


meters : Float -> Length Meters
meters =
    Length


addMeters : Length Meters -> Length Meters -> Length Meters
addMeters (Length a) (Length b) =
    Length (a + b)


toFloat_ : Length unit -> Float
toFloat_ (Length x) =
    x

module ExtensibleRecordFunctions exposing (birthday, describe, label)

-- A record type with a trailing variable accepts any record that has
-- AT LEAST those fields.


type alias Person =
    { name : String, age : Int, city : String }


type alias Pet =
    { name : String, species : String }


label : { a | name : String } -> String
label thing =
    "<" ++ thing.name ++ ">"


birthday : { a | age : Int } -> { a | age : Int }
birthday thing =
    { thing | age = thing.age + 1 }


describe : { a | name : String, age : Int } -> String
describe thing =
    thing.name ++ " is " ++ String.fromInt thing.age



-- label (Person "Ada" 36 "London") == "<Ada>"
-- label (Pet "Rex" "dog")          == "<Rex>"
-- (birthday (Person "Ada" 36 "London")).age == 37

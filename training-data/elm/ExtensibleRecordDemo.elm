module ExtensibleRecordDemo exposing (describe, greet)


greet : { a | name : String } -> String
greet person =
    "Hello, " ++ person.name ++ "!"


describe : { a | name : String, age : Int } -> String
describe person =
    person.name ++ " is " ++ String.fromInt person.age ++ " years old"

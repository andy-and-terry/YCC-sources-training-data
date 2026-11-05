module Main exposing (main)

import Html exposing (text)


type alias User =
    { name : String, age : Int }


birthday : User -> User
birthday u =
    { u | age = u.age + 1 }


main =
    text (Debug.toString (birthday { name = "Ann", age = 30 }))

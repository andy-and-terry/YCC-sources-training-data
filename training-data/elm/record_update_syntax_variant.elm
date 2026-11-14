module Main exposing (main)

import Html exposing (text)

type alias User = { name : String, age : Int }

main =
    let
        u = { name = "Ann", age = 30 }
    in
    text (Debug.toString { u | age = u.age + 1 })

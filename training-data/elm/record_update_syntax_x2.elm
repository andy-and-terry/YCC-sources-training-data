module Main exposing (main)

import Html exposing (text)

type alias Model = { count : Int, name : String }

main =
    let m = { count = 0, name = "x" }
    in text (Debug.toString { m | count = m.count + 1 })

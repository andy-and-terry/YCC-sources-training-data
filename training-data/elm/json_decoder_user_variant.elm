module Main exposing (main)

import Html exposing (text)
import Json.Decode as D

type alias User = { name : String, age : Int }

decoder : D.Decoder User
decoder = D.map2 User (D.field "name" D.string) (D.field "age" D.int)

main =
    text (Debug.toString (D.decodeString decoder "{\"name\":\"Ann\",\"age\":30}"))

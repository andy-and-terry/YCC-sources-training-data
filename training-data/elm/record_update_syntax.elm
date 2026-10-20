module Main exposing (main)

import Html exposing (text)

type alias User = { name : String, age : Int }

older : User -> User
older u = { u | age = u.age + 1 }

main = text (String.fromInt (older { name = "a", age = 9 }).age)

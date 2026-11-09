module User exposing (decoder)

import Json.Decode as D

type alias User = { id : Int, name : String }

decoder : D.Decoder User
decoder =
    D.map2 User (D.field "id" D.int) (D.field "name" D.string)

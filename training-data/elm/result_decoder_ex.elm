module ResultDecoderEx exposing (decodeUser)

import Json.Decode as D


type alias User =
    { id : Int, name : String }


decodeUser : String -> Result D.Error User
decodeUser =
    D.decodeString
        (D.map2 User (D.field "id" D.int) (D.field "name" D.string))

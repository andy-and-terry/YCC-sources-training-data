module JsonDecoderPipeline exposing (Item, decodeItems, itemDecoder)

import Json.Decode as D exposing (Decoder)


type alias Item =
    { id : Int
    , name : String
    , price : Float
    , tags : List String
    , note : Maybe String
    }


itemDecoder : Decoder Item
itemDecoder =
    D.map5 Item
        (D.field "id" D.int)
        (D.field "name" D.string)
        (D.field "price" D.float)
        (D.oneOf [ D.field "tags" (D.list D.string), D.succeed [] ])
        (D.maybe (D.field "note" D.string))


decodeItems : String -> Result String (List Item)
decodeItems json =
    D.decodeString (D.field "items" (D.list itemDecoder)) json
        |> Result.mapError D.errorToString

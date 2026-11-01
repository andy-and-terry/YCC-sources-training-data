module HtmlViewListEx exposing (view)

import Html exposing (Html, li, text, ul)


view : List String -> Html msg
view items =
    ul [] (List.map (\i -> li [] [ text i ]) items)

module Group exposing (countWords)

import Dict exposing (Dict)

countWords : List String -> Dict String Int
countWords =
    List.foldl
        (\w d -> Dict.update w (Maybe.map ((+) 1) >> Maybe.withDefault 1 >> Just) d)
        Dict.empty

module DictSetArrayOps exposing (inventory, uniqueSorted, updateStock)

import Array exposing (Array)
import Dict exposing (Dict)
import Set


inventory : Dict String Int
inventory =
    Dict.fromList [ ( "apple", 3 ), ( "pear", 0 ), ( "fig", 12 ) ]


updateStock : String -> Int -> Dict String Int -> Dict String Int
updateStock item delta =
    Dict.update item (\old -> Just (Maybe.withDefault 0 old + delta))


uniqueSorted : List Int -> List Int
uniqueSorted =
    Set.fromList >> Set.toList


inStock : Dict String Int -> List String
inStock d =
    d |> Dict.filter (\_ n -> n > 0) |> Dict.keys


swapFirstLast : Array a -> Array a
swapFirstLast arr =
    case ( Array.get 0 arr, Array.get (Array.length arr - 1) arr ) of
        ( Just f, Just l ) ->
            arr |> Array.set 0 l |> Array.set (Array.length arr - 1) f

        _ ->
            arr

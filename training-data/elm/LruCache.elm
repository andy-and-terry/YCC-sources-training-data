module LruCache exposing (Cache, empty, get, put)

import Dict exposing (Dict)


{-| A small LRU cache: `order` tracks keys from most- to least-recently-used
so eviction is just dropping the last element once `capacity` is exceeded.
-}
type alias Cache =
    { capacity : Int
    , values : Dict Int Int
    , order : List Int
    }


empty : Int -> Cache
empty capacity =
    { capacity = capacity, values = Dict.empty, order = [] }


touch : Int -> List Int -> List Int
touch key order =
    key :: List.filter (\k -> k /= key) order


get : Int -> Cache -> ( Maybe Int, Cache )
get key cache =
    case Dict.get key cache.values of
        Nothing ->
            ( Nothing, cache )

        Just value ->
            ( Just value, { cache | order = touch key cache.order } )


put : Int -> Int -> Cache -> Cache
put key value cache =
    let
        order1 =
            touch key cache.order

        values1 =
            Dict.insert key value cache.values
    in
    if List.length order1 <= cache.capacity then
        { cache | values = values1, order = order1 }

    else
        case List.reverse order1 of
            leastRecent :: keptReversed ->
                { cache
                    | values = Dict.remove leastRecent values1
                    , order = List.reverse keptReversed
                }

            [] ->
                { cache | values = values1, order = order1 }

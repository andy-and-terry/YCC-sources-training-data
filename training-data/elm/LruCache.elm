module LruCache exposing (Cache, empty, get, put)

import Dict exposing (Dict)


type alias Cache =
    { capacity : Int
    , items : Dict Int String
    , order : List Int
    }


empty : Int -> Cache
empty capacity =
    { capacity = capacity, items = Dict.empty, order = [] }


get : Int -> Cache -> ( Maybe String, Cache )
get key cache =
    case Dict.get key cache.items of
        Nothing ->
            ( Nothing, cache )

        Just value ->
            ( Just value, { cache | order = touch key cache.order } )


put : Int -> String -> Cache -> Cache
put key value cache =
    let
        items1 =
            Dict.insert key value cache.items

        order1 =
            touch key cache.order
    in
    if Dict.size items1 <= cache.capacity then
        { cache | items = items1, order = order1 }

    else
        evictLeastRecentlyUsed { cache | items = items1, order = order1 }


touch : Int -> List Int -> List Int
touch key order =
    key :: List.filter ((/=) key) order


evictLeastRecentlyUsed : Cache -> Cache
evictLeastRecentlyUsed cache =
    case List.reverse cache.order of
        [] ->
            cache

        lru :: _ ->
            { cache
                | items = Dict.remove lru cache.items
                , order = List.filter ((/=) lru) cache.order
            }

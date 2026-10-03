module LfuCache exposing (Cache, empty, get, put)

import Dict exposing (Dict)


type alias Cache =
    { capacity : Int
    , values : Dict Int Int
    , freq : Dict Int Int
    }


empty : Int -> Cache
empty capacity =
    { capacity = capacity, values = Dict.empty, freq = Dict.empty }


get : Int -> Cache -> ( Maybe Int, Cache )
get key cache =
    case Dict.get key cache.values of
        Just value ->
            ( Just value, { cache | freq = Dict.update key (Maybe.map ((+) 1)) cache.freq } )

        Nothing ->
            ( Nothing, cache )


put : Int -> Int -> Cache -> Cache
put key value cache =
    if cache.capacity == 0 then
        cache

    else if Dict.member key cache.values then
        { cache
            | values = Dict.insert key value cache.values
            , freq = Dict.update key (Maybe.map ((+) 1)) cache.freq
        }

    else if Dict.size cache.values >= cache.capacity then
        let
            evictKey =
                cache.freq
                    |> Dict.toList
                    |> List.sortBy Tuple.second
                    |> List.head
                    |> Maybe.map Tuple.first
                    |> Maybe.withDefault key
        in
        { cache
            | values = cache.values |> Dict.remove evictKey |> Dict.insert key value
            , freq = cache.freq |> Dict.remove evictKey |> Dict.insert key 1
        }

    else
        { cache
            | values = Dict.insert key value cache.values
            , freq = Dict.insert key 1 cache.freq
        }

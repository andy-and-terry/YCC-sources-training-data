module ListPatternMatching exposing (describe, lastTwo, secondItem)


describe : List a -> String
describe list =
    case list of
        [] ->
            "empty"

        [ _ ] ->
            "singleton"

        [ _, _ ] ->
            "pair"

        _ :: _ :: _ :: _ ->
            "three or more"


secondItem : List a -> Maybe a
secondItem list =
    case list of
        _ :: second :: _ ->
            Just second

        _ ->
            Nothing


lastTwo : List a -> Maybe ( a, a )
lastTwo list =
    case list of
        [ a, b ] ->
            Just ( a, b )

        _ :: rest ->
            lastTwo rest

        [] ->
            Nothing

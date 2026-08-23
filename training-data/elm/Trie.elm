module Trie exposing (Trie, contains, empty, insert)

import Dict exposing (Dict)


type Trie
    = Trie
        { children : Dict Char Trie
        , isEnd : Bool
        }


empty : Trie
empty =
    Trie { children = Dict.empty, isEnd = False }


insert : String -> Trie -> Trie
insert word trie =
    insertChars (String.toList word) trie


insertChars : List Char -> Trie -> Trie
insertChars chars (Trie node) =
    case chars of
        [] ->
            Trie { node | isEnd = True }

        c :: rest ->
            let
                child =
                    Dict.get c node.children |> Maybe.withDefault empty

                updatedChild =
                    insertChars rest child
            in
            Trie { node | children = Dict.insert c updatedChild node.children }


contains : String -> Trie -> Bool
contains word trie =
    containsChars (String.toList word) trie


containsChars : List Char -> Trie -> Bool
containsChars chars (Trie node) =
    case chars of
        [] ->
            node.isEnd

        c :: rest ->
            case Dict.get c node.children of
                Just child ->
                    containsChars rest child

                Nothing ->
                    False

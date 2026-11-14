module Main exposing (main)

import Html exposing (text)

type Tree = Leaf | Node Tree Int Tree

depth : Tree -> Int
depth t =
    case t of
        Leaf -> 0
        Node l _ r -> 1 + max (depth l) (depth r)

main = text (String.fromInt (depth (Node (Node Leaf 1 Leaf) 2 Leaf)))

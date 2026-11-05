module Main exposing (main)

import Html exposing (text)


type Tree
    = Leaf
    | Node Tree Int Tree


sum : Tree -> Int
sum t =
    case t of
        Leaf -> 0
        Node l v r -> sum l + v + sum r


main =
    text (String.fromInt (sum (Node (Node Leaf 1 Leaf) 2 (Node Leaf 3 Leaf))))

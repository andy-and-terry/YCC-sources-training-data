module AvlTree exposing (Tree(..), insert, toList)


type Tree
    = Leaf
    | Node Tree Int Int Tree


height : Tree -> Int
height tree =
    case tree of
        Leaf ->
            0

        Node _ _ h _ ->
            h


make : Tree -> Int -> Tree -> Tree
make left value right =
    Node left value (1 + max (height left) (height right)) right


balanceFactor : Tree -> Int
balanceFactor tree =
    case tree of
        Leaf ->
            0

        Node left _ _ right ->
            height left - height right


rotateLeft : Tree -> Tree
rotateLeft tree =
    case tree of
        Node left value _ (Node rl rv _ rr) ->
            make (make left value rl) rv rr

        _ ->
            tree


rotateRight : Tree -> Tree
rotateRight tree =
    case tree of
        Node (Node ll lv _ lr) value _ right ->
            make ll lv (make lr value right)

        _ ->
            tree


balance : Tree -> Tree
balance tree =
    case tree of
        Leaf ->
            Leaf

        Node left value _ right ->
            let
                bf =
                    balanceFactor tree
            in
            if bf > 1 then
                if balanceFactor left < 0 then
                    rotateRight (make (rotateLeft left) value right)

                else
                    rotateRight tree

            else if bf < -1 then
                if balanceFactor right > 0 then
                    rotateLeft (make left value (rotateRight right))

                else
                    rotateLeft tree

            else
                tree


insert : Int -> Tree -> Tree
insert value tree =
    case tree of
        Leaf ->
            make Leaf value Leaf

        Node left v _ right ->
            if value < v then
                balance (make (insert value left) v right)

            else if value > v then
                balance (make left v (insert value right))

            else
                tree


toList : Tree -> List Int
toList tree =
    case tree of
        Leaf ->
            []

        Node left value _ right ->
            toList left ++ value :: toList right

module BinaryTree exposing (Tree(..), inorder, insert)


type Tree
    = Leaf
    | Node Tree Int Tree


insert : Int -> Tree -> Tree
insert value tree =
    case tree of
        Leaf ->
            Node Leaf value Leaf

        Node left v right ->
            if value < v then
                Node (insert value left) v right

            else if value > v then
                Node left v (insert value right)

            else
                tree


inorder : Tree -> List Int
inorder tree =
    case tree of
        Leaf ->
            []

        Node left v right ->
            inorder left ++ [ v ] ++ inorder right

module InvertBinaryTree exposing (Tree(..), inorder, invert)


type Tree
    = Leaf
    | Node Int Tree Tree


invert : Tree -> Tree
invert tree =
    case tree of
        Leaf ->
            Leaf

        Node value left right ->
            Node value (invert right) (invert left)


inorder : Tree -> List Int
inorder tree =
    case tree of
        Leaf ->
            []

        Node value left right ->
            inorder left ++ [ value ] ++ inorder right

module BinaryTreeDiameter exposing (Tree(..), diameter)


type Tree
    = Leaf
    | Node Int Tree Tree


diameter : Tree -> Int
diameter tree =
    Tuple.first (diameterAndHeight tree)


diameterAndHeight : Tree -> ( Int, Int )
diameterAndHeight tree =
    case tree of
        Leaf ->
            ( 0, 0 )

        Node _ left right ->
            let
                ( leftDiam, leftHeight ) =
                    diameterAndHeight left

                ( rightDiam, rightHeight ) =
                    diameterAndHeight right

                throughRoot =
                    leftHeight + rightHeight
            in
            ( max throughRoot (max leftDiam rightDiam), max leftHeight rightHeight + 1 )

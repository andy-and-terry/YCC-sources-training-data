module LowestCommonAncestor exposing (Tree(..), lca)


type Tree
    = Leaf
    | Node Int Tree Tree


lca : Tree -> Int -> Int -> Maybe Int
lca tree p q =
    case tree of
        Leaf ->
            Nothing

        Node value left right ->
            if value == p || value == q then
                Just value

            else
                case ( lca left p q, lca right p q ) of
                    ( Just _, Just _ ) ->
                        Just value

                    ( Just l, Nothing ) ->
                        Just l

                    ( Nothing, Just r ) ->
                        Just r

                    ( Nothing, Nothing ) ->
                        Nothing

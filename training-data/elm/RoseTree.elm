module RoseTree exposing (Tree(..), depth, flatten, mapTree, size)


type Tree a
    = Node a (List (Tree a))


mapTree : (a -> b) -> Tree a -> Tree b
mapTree f (Node value children) =
    Node (f value) (List.map (mapTree f) children)


flatten : Tree a -> List a
flatten (Node value children) =
    value :: List.concatMap flatten children


size : Tree a -> Int
size tree =
    List.length (flatten tree)


depth : Tree a -> Int
depth (Node _ children) =
    1 + Maybe.withDefault 0 (List.maximum (List.map depth children))

module Tree exposing (depth)

type Tree a = Leaf | Node (Tree a) a (Tree a)

depth : Tree a -> Int
depth t =
    case t of
        Leaf -> 0
        Node l _ r -> 1 + max (depth l) (depth r)

module RecursionTreesFolds exposing (Tree(..), depth, fromList, insert, toList)


type Tree comparable
    = Empty
    | Node (Tree comparable) comparable (Tree comparable)


insert : comparable -> Tree comparable -> Tree comparable
insert x tree =
    case tree of
        Empty ->
            Node Empty x Empty

        Node l v r ->
            if x < v then
                Node (insert x l) v r

            else if x > v then
                Node l v (insert x r)

            else
                tree


fromList : List comparable -> Tree comparable
fromList =
    List.foldl insert Empty


toList : Tree comparable -> List comparable
toList tree =
    case tree of
        Empty ->
            []

        Node l v r ->
            toList l ++ [ v ] ++ toList r


depth : Tree comparable -> Int
depth tree =
    case tree of
        Empty ->
            0

        Node l _ r ->
            1 + max (depth l) (depth r)

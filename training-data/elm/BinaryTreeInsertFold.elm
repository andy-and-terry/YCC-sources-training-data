module BinaryTreeInsertFold exposing (Tree(..), fromList, inOrder, insert)


type Tree comparable
    = Leaf
    | Branch (Tree comparable) comparable (Tree comparable)


insert : comparable -> Tree comparable -> Tree comparable
insert x tree =
    case tree of
        Leaf ->
            Branch Leaf x Leaf

        Branch l v r ->
            if x < v then
                Branch (insert x l) v r

            else if x > v then
                Branch l v (insert x r)

            else
                tree


fromList : List comparable -> Tree comparable
fromList =
    List.foldl insert Leaf


inOrder : Tree comparable -> List comparable
inOrder tree =
    case tree of
        Leaf ->
            []

        Branch l v r ->
            inOrder l ++ [ v ] ++ inOrder r

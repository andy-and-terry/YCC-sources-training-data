module LinkedListDemo exposing (LinkedList(..), fromList, reverse, toList)


type LinkedList a
    = Empty
    | Node a (LinkedList a)


fromList : List a -> LinkedList a
fromList items =
    List.foldr Node Empty items


toList : LinkedList a -> List a
toList list =
    case list of
        Empty ->
            []

        Node v rest ->
            v :: toList rest


reverse : LinkedList a -> LinkedList a
reverse list =
    reverseHelp list Empty


reverseHelp : LinkedList a -> LinkedList a -> LinkedList a
reverseHelp list acc =
    case list of
        Empty ->
            acc

        Node v rest ->
            reverseHelp rest (Node v acc)

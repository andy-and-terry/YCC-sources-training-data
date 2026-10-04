module ListZipper exposing (Zipper, current, fromList, left, replace, right, toList)


type alias Zipper a =
    { before : List a
    , focus : a
    , after : List a
    }


fromList : List a -> Maybe (Zipper a)
fromList items =
    case items of
        [] ->
            Nothing

        x :: rest ->
            Just { before = [], focus = x, after = rest }


current : Zipper a -> a
current zipper =
    zipper.focus


right : Zipper a -> Maybe (Zipper a)
right zipper =
    case zipper.after of
        [] ->
            Nothing

        next :: rest ->
            Just { before = zipper.focus :: zipper.before, focus = next, after = rest }


left : Zipper a -> Maybe (Zipper a)
left zipper =
    case zipper.before of
        [] ->
            Nothing

        prev :: rest ->
            Just { before = rest, focus = prev, after = zipper.focus :: zipper.after }


replace : a -> Zipper a -> Zipper a
replace value zipper =
    { zipper | focus = value }


toList : Zipper a -> List a
toList zipper =
    List.reverse zipper.before ++ zipper.focus :: zipper.after

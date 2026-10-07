module ListZipper exposing (Zipper, fromList, left, right, toList)


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


right : Zipper a -> Maybe (Zipper a)
right z =
    case z.after of
        [] ->
            Nothing

        x :: rest ->
            Just { before = z.focus :: z.before, focus = x, after = rest }


left : Zipper a -> Maybe (Zipper a)
left z =
    case z.before of
        [] ->
            Nothing

        x :: rest ->
            Just { before = rest, focus = x, after = z.focus :: z.after }


toList : Zipper a -> List a
toList z =
    List.reverse z.before ++ (z.focus :: z.after)

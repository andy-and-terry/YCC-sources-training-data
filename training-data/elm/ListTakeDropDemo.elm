module ListTakeDropDemo exposing (middle, paginate)


paginate : Int -> Int -> List a -> List a
paginate pageSize page items =
    items
        |> List.drop (pageSize * page)
        |> List.take pageSize


middle : List a -> List a
middle items =
    items
        |> List.drop 1
        |> List.reverse
        |> List.drop 1
        |> List.reverse

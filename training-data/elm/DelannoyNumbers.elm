module DelannoyNumbers exposing (delannoy)


delannoy : Int -> Int -> Int
delannoy m n =
    if m == 0 || n == 0 then
        1

    else
        delannoy (m - 1) n + delannoy m (n - 1) + delannoy (m - 1) (n - 1)

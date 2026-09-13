module Quickselect exposing (kthSmallest)

import Array exposing (Array)


kthSmallest : Int -> List Int -> Maybe Int
kthSmallest k numbers =
    let
        arr =
            Array.fromList numbers
    in
    if k < 1 || k > Array.length arr then
        Nothing

    else
        Just (select arr (k - 1))


select : Array Int -> Int -> Int
select arr k =
    case Array.toList arr of
        [] ->
            0

        pivot :: rest ->
            let
                lower =
                    List.filter (\x -> x < pivot) rest

                upper =
                    List.filter (\x -> x >= pivot) rest

                lowerCount =
                    List.length lower
            in
            if k < lowerCount then
                select (Array.fromList lower) k

            else if k == lowerCount then
                pivot

            else
                select (Array.fromList upper) (k - lowerCount - 1)

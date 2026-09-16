module SegmentTree exposing (build, rangeSum)

import Array exposing (Array)


build : List Int -> Array Int
build values =
    let
        n =
            List.length values

        arr =
            Array.fromList values

        tree =
            Array.repeat (4 * max n 1) 0
    in
    buildHelp arr 1 0 (n - 1) tree


buildHelp : Array Int -> Int -> Int -> Int -> Array Int -> Array Int
buildHelp arr node lo hi tree =
    if lo == hi then
        Array.set node (Maybe.withDefault 0 (Array.get lo arr)) tree

    else
        let
            mid =
                (lo + hi) // 2

            tree1 =
                buildHelp arr (2 * node) lo mid tree

            tree2 =
                buildHelp arr (2 * node + 1) (mid + 1) hi tree1

            leftVal =
                Maybe.withDefault 0 (Array.get (2 * node) tree2)

            rightVal =
                Maybe.withDefault 0 (Array.get (2 * node + 1) tree2)
        in
        Array.set node (leftVal + rightVal) tree2


query : Array Int -> Int -> Int -> Int -> Int -> Int -> Int
query tree node lo hi l r =
    if r < lo || hi < l then
        0

    else if l <= lo && hi <= r then
        Maybe.withDefault 0 (Array.get node tree)

    else
        let
            mid =
                (lo + hi) // 2
        in
        query tree (2 * node) lo mid l r + query tree (2 * node + 1) (mid + 1) hi l r


rangeSum : List Int -> Int -> Int -> Int
rangeSum values l r =
    let
        n =
            List.length values

        tree =
            build values
    in
    query tree 1 0 (n - 1) l r

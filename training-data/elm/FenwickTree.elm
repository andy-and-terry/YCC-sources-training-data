module FenwickTree exposing (Fenwick, empty, prefixSum, rangeSum, update)

import Array exposing (Array)
import Bitwise


type alias Fenwick =
    Array Int


empty : Int -> Fenwick
empty size =
    Array.repeat (size + 1) 0


update : Int -> Int -> Fenwick -> Fenwick
update index delta fenwick =
    updateHelp index delta (Array.length fenwick - 1) fenwick


updateHelp : Int -> Int -> Int -> Fenwick -> Fenwick
updateHelp index delta size fenwick =
    if index > size then
        fenwick

    else
        let
            current =
                Maybe.withDefault 0 (Array.get index fenwick)

            fenwick1 =
                Array.set index (current + delta) fenwick

            next =
                index + Bitwise.and index (negate index)
        in
        updateHelp next delta size fenwick1


prefixSum : Int -> Fenwick -> Int
prefixSum index fenwick =
    prefixSumHelp index fenwick 0


prefixSumHelp : Int -> Fenwick -> Int -> Int
prefixSumHelp index fenwick acc =
    if index <= 0 then
        acc

    else
        let
            value =
                Maybe.withDefault 0 (Array.get index fenwick)

            next =
                index - Bitwise.and index (negate index)
        in
        prefixSumHelp next fenwick (acc + value)


rangeSum : Int -> Int -> Fenwick -> Int
rangeSum l r fenwick =
    prefixSum r fenwick - prefixSum (l - 1) fenwick

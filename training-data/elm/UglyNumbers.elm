module UglyNumbers exposing (ugly)

import Array exposing (Array)


type alias State =
    { seq : Array Int, i2 : Int, i3 : Int, i5 : Int }


at : Int -> Array Int -> Int
at i arr =
    Array.get i arr |> Maybe.withDefault 0


step : State -> State
step st =
    let
        c2 =
            at st.i2 st.seq * 2

        c3 =
            at st.i3 st.seq * 3

        c5 =
            at st.i5 st.seq * 5

        next =
            min c2 (min c3 c5)

        bump c i =
            if next == c then
                i + 1

            else
                i
    in
    { seq = Array.push next st.seq, i2 = bump c2 st.i2, i3 = bump c3 st.i3, i5 = bump c5 st.i5 }


ugly : Int -> Int
ugly n =
    let
        go st =
            if Array.length st.seq >= n then
                at (n - 1) st.seq

            else
                go (step st)
    in
    go { seq = Array.fromList [ 1 ], i2 = 0, i3 = 0, i5 = 0 }

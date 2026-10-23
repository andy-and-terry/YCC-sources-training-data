module RandomStepDemo exposing (rollDice, rollMany)

import Random


rollDie : Random.Generator Int
rollDie =
    Random.int 1 6


rollDice : Random.Seed -> ( Int, Random.Seed )
rollDice seed =
    Random.step rollDie seed


{-| Threading the seed through each step keeps generation pure.
-}
rollMany : Int -> Random.Seed -> List Int
rollMany count seed =
    Random.step (Random.list count rollDie) seed
        |> Tuple.first



-- rollMany 3 (Random.initialSeed 42) always gives the same three numbers.

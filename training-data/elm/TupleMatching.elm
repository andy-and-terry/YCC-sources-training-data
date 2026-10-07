module TupleMatching exposing (fizzBuzz)


fizzBuzz : Int -> String
fizzBuzz n =
    case ( modBy 3 n, modBy 5 n ) of
        ( 0, 0 ) ->
            "FizzBuzz"

        ( 0, _ ) ->
            "Fizz"

        ( _, 0 ) ->
            "Buzz"

        _ ->
            String.fromInt n

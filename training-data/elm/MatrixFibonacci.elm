module MatrixFibonacci exposing (fib)


type alias Mat =
    { a : Int, b : Int, c : Int, d : Int }


identityMat : Mat
identityMat =
    { a = 1, b = 0, c = 0, d = 1 }


multiply : Mat -> Mat -> Mat
multiply x y =
    { a = x.a * y.a + x.b * y.c
    , b = x.a * y.b + x.b * y.d
    , c = x.c * y.a + x.d * y.c
    , d = x.c * y.b + x.d * y.d
    }


fib : Int -> Int
fib n =
    loop n identityMat { a = 1, b = 1, c = 1, d = 0 }


loop : Int -> Mat -> Mat -> Int
loop n result base =
    if n <= 0 then
        result.b

    else
        let
            next =
                if modBy 2 n == 1 then
                    multiply result base

                else
                    result
        in
        loop (n // 2) next (multiply base base)

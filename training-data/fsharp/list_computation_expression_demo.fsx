let pairs =
    [ for x in 1 .. 3 do
          for y in 1 .. 3 do
              if x <> y then
                  yield (x, y) ]

let interleaved =
    [ yield! [ 1; 2; 3 ]
      yield 0
      yield! [ 4; 5; 6 ] ]

printfn "%A" pairs
printfn "%A" interleaved

let floydWarshall (graph: float[,]) =
    let n = Array2D.length1 graph
    let dist = Array2D.copy graph
    for k in 0 .. n - 1 do
        for i in 0 .. n - 1 do
            for j in 0 .. n - 1 do
                if dist.[i, k] + dist.[k, j] < dist.[i, j] then
                    dist.[i, j] <- dist.[i, k] + dist.[k, j]
    dist

let inf = System.Double.PositiveInfinity

let graph =
    array2D
        [ [ 0.0; 3.0; inf; 7.0 ]
          [ 8.0; 0.0; 2.0; inf ]
          [ 5.0; inf; 0.0; 1.0 ]
          [ 2.0; inf; inf; 0.0 ] ]

let result = floydWarshall graph
printfn "%A" result

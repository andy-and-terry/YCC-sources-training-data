import Data.Array

inf :: Int
inf = maxBound `div` 2

floydWarshall :: Int -> [(Int, Int, Int)] -> Array (Int, Int) Int
floydWarshall n edges = foldl relaxK initial [0 .. n - 1]
  where
    bounds' = ((0, 0), (n - 1, n - 1))
    base = [((i, j), if i == j then 0 else inf) | i <- [0 .. n - 1], j <- [0 .. n - 1]]
    withEdges = base ++ [((u, v), w) | (u, v, w) <- edges]
    initial = accumArray min inf bounds' withEdges
    relaxK dist k =
      accumArray
        min
        inf
        bounds'
        [ ((i, j), min (dist ! (i, j)) (dist ! (i, k) + dist ! (k, j)))
        | i <- [0 .. n - 1]
        , j <- [0 .. n - 1]
        ]

main :: IO ()
main = do
  let edges = [(0, 1, 3), (0, 2, 8), (1, 2, 2), (2, 0, 5), (2, 3, 1), (3, 0, 2)]
      dist = floydWarshall 4 edges
  mapM_ (\i -> print [dist ! (i, j) | j <- [0 .. 3]]) [0 .. 3]

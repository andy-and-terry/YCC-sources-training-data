-- Squarefree numbers up to 100; expect 61.
squarefree :: Int -> Bool
squarefree n = all (\d -> n `mod` (d * d) /= 0) (takeWhile (\d -> d * d <= n) [2 ..])

main :: IO ()
main = print (length (filter squarefree [1 .. 100]))

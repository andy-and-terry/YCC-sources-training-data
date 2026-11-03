triangular :: [Int]
triangular = scanl1 (+) [1 ..]

main :: IO ()
main = print (take 10 triangular)

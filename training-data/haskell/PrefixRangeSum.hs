newtype RangeSum = RangeSum [Int]

mkRangeSum :: [Int] -> RangeSum
mkRangeSum = RangeSum . scanl (+) 0

query :: RangeSum -> Int -> Int -> Int
query (RangeSum p) lo hi = p !! hi - p !! lo

main :: IO ()
main = print (query (mkRangeSum [3, 1, 4, 1, 5, 9, 2, 6]) 2 5)

-- Narayana's cows N(n)=N(n-1)+N(n-3)
seqVals :: [Int]
seqVals = [1, 1, 1] ++ zipWith (+) (drop (3 - 1) seqVals) (drop (3 - 3) seqVals)

main :: IO ()
main = putStrLn . unwords . map show . take 10 $ seqVals

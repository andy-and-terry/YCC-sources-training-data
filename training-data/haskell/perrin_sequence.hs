-- Perrin sequence P(n)=P(n-2)+P(n-3)
seqVals :: [Int]
seqVals = [3, 0, 2] ++ zipWith (+) (drop (3 - 2) seqVals) (drop (3 - 3) seqVals)

main :: IO ()
main = putStrLn . unwords . map show . take 10 $ seqVals

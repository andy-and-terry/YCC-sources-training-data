-- Ways to write n as a sum of two or more consecutive positive integers.
politeWays :: Int -> Int
politeWays n = length [k | k <- takeWhile (\k -> k * (k + 1) `div` 2 <= n) [2 ..], (n - k * (k - 1) `div` 2) `mod` k == 0]

main :: IO ()
main = putStrLn . unwords . map (show . politeWays) $ [1 .. 16]

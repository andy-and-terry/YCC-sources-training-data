data Classification = Perfect | Abundant | Deficient deriving (Show)

aliquotSum :: Int -> Int
aliquotSum 1 = 0
aliquotSum n = 1 + sum [d + other | d <- takeWhile (\i -> i * i <= n) [2 ..], n `mod` d == 0, let q = n `div` d, let other = if q == d then 0 else q]

classify :: Int -> Classification
classify n = case compare (aliquotSum n) n of
  EQ -> Perfect
  GT -> Abundant
  LT -> Deficient

main :: IO ()
main = mapM_ (\n -> putStrLn (show n ++ " " ++ show (classify n))) [6, 12, 28, 13, 8128]

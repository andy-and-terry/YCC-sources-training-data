-- Lazy infinite list of Pell numbers: P(n) = 2*P(n-1) + P(n-2)
pell :: [Integer]
pell = 0 : 1 : zipWith (\a b -> 2 * b + a) pell (tail pell)

main :: IO ()
main = mapM_ (\(i, p) -> putStrLn ("P(" ++ show i ++ ") = " ++ show p))
             (zip [0 :: Int ..] (take 15 pell))

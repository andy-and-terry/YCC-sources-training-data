-- Tribonacci: T0=0, T1=0, T2=1, T(n) = T(n-1) + T(n-2) + T(n-3)
tribonacci :: [Integer]
tribonacci = 0 : 0 : 1 : zipWith3 (\a b c -> a + b + c) tribonacci (tail tribonacci) (drop 2 tribonacci)

main :: IO ()
main = putStrLn $ "Tribonacci: " ++ show (take 15 tribonacci)

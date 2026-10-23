-- Sylvester's sequence: s(0) = 2, s(n+1) = s(n)^2 - s(n) + 1
sylvester :: [Integer]
sylvester = iterate (\s -> s * s - s + 1) 2

main :: IO ()
main = mapM_ (\(i, s) -> putStrLn ("s(" ++ show i ++ ") = " ++ show s))
             (zip [0 :: Int ..] (take 8 sylvester))

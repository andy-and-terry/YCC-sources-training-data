-- Euler zigzag numbers via the Seidel-Entringer boustrophedon.
step :: [Integer] -> [Integer]
step row = scanl (+) 0 (reverse row)

main :: IO ()
main = putStrLn . unwords . map (show . last) . take 10 $ iterate step [1]

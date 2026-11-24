-- Moser-de Bruijn sequence: binary digits of n read in base 4.
moser :: Int -> Int
moser 0 = 0
moser n = (n `mod` 2) + 4 * moser (n `div` 2)

main :: IO ()
main = putStrLn (unwords (map (show . moser) [0 .. 11]))

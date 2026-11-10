-- Read the binary digits of i as base-4 digits.
moserDeBruijn :: Int -> Int
moserDeBruijn 0 = 0
moserDeBruijn i = (i `mod` 2) + 4 * moserDeBruijn (i `div` 2)

main :: IO ()
main = putStrLn (unwords (map (show . moserDeBruijn) [0 .. 9])) -- 0 1 4 5 16 17 20 21 64 65

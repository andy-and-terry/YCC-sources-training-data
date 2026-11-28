import Data.List (sort)

bwt :: String -> String
bwt s = map last (sort [drop i s ++ take i s | i <- [0 .. length s - 1]])

main :: IO ()
main = putStrLn (bwt "banana$")

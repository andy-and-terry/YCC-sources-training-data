import Data.List (isSuffixOf)

isAutomorphic :: Integer -> Bool
isAutomorphic n = show n `isSuffixOf` show (n * n)

main :: IO ()
main = print (filter isAutomorphic [0 .. 999]) -- [0,1,5,6,25,76,376,625]

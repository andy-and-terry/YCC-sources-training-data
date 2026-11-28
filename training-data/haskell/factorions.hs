import Data.Char (digitToInt)

fact :: Int -> Int
fact k = product [1 .. k]

isFactorion :: Int -> Bool
isFactorion n = sum (map (fact . digitToInt) (show n)) == n

main :: IO ()
main = print (filter isFactorion [1 .. 50000]) -- [1,2,145,40585]

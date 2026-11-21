-- Count bouncy numbers (neither increasing nor decreasing digits) below 1000.
import Data.List (sort)

isBouncy :: Int -> Bool
isBouncy n = d /= sort d && d /= reverse (sort d)
  where d = show n

main :: IO ()
main = print (length (filter isBouncy [1 .. 999]))

import Data.Array

coinChange :: [Int] -> Int -> Int
coinChange coins amount = table ! amount
  where
    table = listArray (0, amount) [go a | a <- [0 .. amount]]
    go 0 = 0
    go a = case [1 + table ! (a - c) | c <- coins, c <= a, table ! (a - c) >= 0] of
      [] -> -1
      xs -> minimum xs

main :: IO ()
main = print (coinChange [1, 2, 5] 11)

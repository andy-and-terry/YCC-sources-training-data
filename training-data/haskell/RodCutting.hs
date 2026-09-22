rodCutting :: [Int] -> Int -> Int
rodCutting prices n = table !! n
  where
    table = [best len | len <- [0 .. n]]
    best 0 = 0
    best len = maximum [prices !! (cut - 1) + table !! (len - cut) | cut <- [1 .. len], cut <= length prices]

main :: IO ()
main = do
  let prices = [1, 5, 8, 9, 10, 17, 17, 20]
  print (rodCutting prices 8)
  print (rodCutting prices 4)
  print (rodCutting prices 1)

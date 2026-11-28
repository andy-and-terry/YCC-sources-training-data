stern :: [Int]
stern = 0 : 1 : concat [[s !! i, s !! i + s !! (i + 1)] | i <- [1 ..]]
  where s = stern

main :: IO ()
main = print (take 15 stern) -- [0,1,1,2,1,3,2,3,1,4,3,5,2,5,3]

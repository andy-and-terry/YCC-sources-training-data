pronic :: [Int]
pronic = [n * (n + 1) | n <- [0 ..]]

isPronic :: Int -> Bool
isPronic x = n * (n + 1) == x
  where n = floor (sqrt (fromIntegral x :: Double))

main :: IO ()
main = do
  print (take 10 pronic)           -- [0,2,6,12,20,30,42,56,72,90]
  print (isPronic 56, isPronic 57) -- (True,False)

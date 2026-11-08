deltaEncode :: [Int] -> [Int]
deltaEncode xs@(x : rest) = x : zipWith (-) rest xs
deltaEncode [] = []

deltaDecode :: [Int] -> [Int]
deltaDecode = scanl1 (+)

main :: IO ()
main = do
  let d = deltaEncode [10, 12, 15, 15, 20]
  print d
  print (deltaDecode d)

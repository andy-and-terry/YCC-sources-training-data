import Data.Complex

main :: IO ()
main = do
  let z = 3 :+ 4 :: Complex Double
      w = 1 :+ (-2) :: Complex Double
  print (z + w)
  print (z * w)
  print (realPart z, imagPart z)
  print (magnitude z)
  print (conjugate z)
  print (z / z)
  print (mkPolar 1 0 :: Complex Double)
  print (fromIntegral (2 :: Int) * w)

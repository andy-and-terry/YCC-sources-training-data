import Data.Complex

-- Round to two decimals so floating-point noise does not clutter output.
round2 :: Double -> Double
round2 x = fromIntegral (round (x * 100) :: Integer) / 100

roundC :: Complex Double -> (Double, Double)
roundC z = (round2 (realPart z), round2 (imagPart z))

-- The n-th roots of unity are evenly spaced points on the unit circle.
rootsOfUnity :: Int -> [Complex Double]
rootsOfUnity n = [cis (2 * pi * fromIntegral k / fromIntegral n) | k <- [0 .. n - 1]]

main :: IO ()
main = do
  let z = 3 :+ 4 :: Complex Double
      w = 1 :+ 2 :: Complex Double
  print (magnitude z)
  print (realPart z, imagPart z)
  print (conjugate z)
  print (z + w)
  print (z * w)
  print (z / w)
  print (phase (0 :+ 1 :: Complex Double))
  print (roundC (mkPolar 2 (pi / 2)))
  print (map roundC (rootsOfUnity 4))
  print (roundC (exp (0 :+ pi) + 1))

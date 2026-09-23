import Data.Ratio

addFractions :: Rational -> Rational -> Rational
addFractions = (+)

main :: IO ()
main = do
  let a = 1 % 3
      b = 1 % 6
  print (addFractions a b)
  print (numerator (addFractions a b))
  print (denominator (addFractions a b))
  print (3 % 4 * (2 % 3 :: Rational))
  print (fromRational (1 % 4) :: Double)
  print (toRational (0.5 :: Double))

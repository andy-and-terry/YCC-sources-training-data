data V2 = V2 Double Double deriving (Eq, Show)

instance Num V2 where
  V2 a b + V2 c d = V2 (a + c) (b + d)
  V2 a b * V2 c d = V2 (a * c) (b * d)
  abs (V2 a b) = V2 (abs a) (abs b)
  signum (V2 a b) = V2 (signum a) (signum b)
  fromInteger n = V2 (fromInteger n) (fromInteger n)
  negate (V2 a b) = V2 (negate a) (negate b)

norm :: V2 -> Double
norm (V2 a b) = sqrt (a * a + b * b)

main :: IO ()
main = do
  let u = V2 3 4
      v = V2 1 1
  print (u + v)
  print (u - v)
  print (u * 2)
  print (sum [u, v, 10])
  print (norm u)

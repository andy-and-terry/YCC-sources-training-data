newtype MaxInt = MaxInt Int deriving Show

instance Semigroup MaxInt where
  MaxInt a <> MaxInt b = MaxInt (max a b)

instance Monoid MaxInt where
  mempty = MaxInt minBound

main :: IO ()
main = do
  print (MaxInt 3 <> MaxInt 7 <> MaxInt 2)
  print (mconcat [MaxInt 1, MaxInt 9, MaxInt 4])

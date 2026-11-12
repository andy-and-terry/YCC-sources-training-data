newtype MaxInt = MaxInt Int deriving Show

instance Semigroup MaxInt where
  MaxInt a <> MaxInt b = MaxInt (max a b)
instance Monoid MaxInt where
  mempty = MaxInt minBound

main :: IO ()
main = print (mconcat (map MaxInt [3, 9, 4]))

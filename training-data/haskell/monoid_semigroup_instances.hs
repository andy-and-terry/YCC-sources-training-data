newtype MaxInt = MaxInt Int deriving (Show, Eq)

instance Semigroup MaxInt where
  MaxInt a <> MaxInt b = MaxInt (max a b)

instance Monoid MaxInt where
  mempty = MaxInt minBound

data Stats = Stats { count :: Int, total :: Int } deriving Show
instance Semigroup Stats where Stats a b <> Stats c d = Stats (a + c) (b + d)
instance Monoid Stats where mempty = Stats 0 0

main :: IO ()
main = do
  print (mconcat (map MaxInt [3, 9, 2]))
  print (foldMap (\x -> Stats 1 x) [10, 20, 30])
  print (mconcat ["ab", "cd"], [1, 2] <> [3])

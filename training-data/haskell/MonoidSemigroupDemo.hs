newtype Sum' = Sum' Int deriving Show
newtype Max' = Max' Int deriving Show

instance Semigroup Sum' where
  (Sum' a) <> (Sum' b) = Sum' (a + b)

instance Monoid Sum' where
  mempty = Sum' 0

instance Semigroup Max' where
  (Max' a) <> (Max' b) = Max' (max a b)

instance Monoid Max' where
  mempty = Max' minBound

main :: IO ()
main = do
  print (mconcat (map Sum' [1, 2, 3, 4, 5]))
  print (mconcat (map Max' [3, 7, 2, 9, 4]))
  print ([1, 2] <> [3, 4] <> ([] :: [Int]))
  print ("hello, " <> "world")

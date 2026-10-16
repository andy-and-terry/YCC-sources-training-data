{-# LANGUAGE RankNTypes #-}

applyBoth :: (forall a. [a] -> Int) -> ([Int], String) -> (Int, Int)
applyBoth f (xs, s) = (f xs, f s)

applyToAll :: (forall a. [a] -> [a]) -> ([Int], String) -> ([Int], String)
applyToAll f (xs, s) = (f xs, f s)

newtype Church = Church (forall a. (a -> a) -> a -> a)

toInt :: Church -> Int
toInt (Church n) = n (+ 1) 0

three :: Church
three = Church (\f -> f . f . f)

main :: IO ()
main = do
  print (applyBoth length ([1, 2, 3], "hello"))
  print (applyToAll reverse ([1, 2, 3], "abc"))
  print (applyToAll (take 2) ([1, 2, 3], "abc"))
  print (toInt three)

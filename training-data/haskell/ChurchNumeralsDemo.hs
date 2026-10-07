{-# LANGUAGE RankNTypes #-}

newtype Church = Church (forall a. (a -> a) -> a -> a)

zero :: Church
zero = Church (\_ x -> x)

suc :: Church -> Church
suc (Church n) = Church (\f x -> f (n f x))

add :: Church -> Church -> Church
add (Church a) (Church b) = Church (\f x -> a f (b f x))

mul :: Church -> Church -> Church
mul (Church a) (Church b) = Church (\f -> a (b f))

toInt :: Church -> Int
toInt (Church n) = n (+ 1) 0

fromInt :: Int -> Church
fromInt 0 = zero
fromInt k = suc (fromInt (k - 1))

main :: IO ()
main = do
  let two = fromInt 2
      three = fromInt 3
  print (toInt (add two three))
  print (toInt (mul two three))

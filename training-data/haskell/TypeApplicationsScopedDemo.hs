{-# LANGUAGE TypeApplications, ScopedTypeVariables #-}

import Data.Proxy

sizeOfBound :: forall a. (Bounded a, Enum a) => Int
sizeOfBound = fromEnum (maxBound @a) - fromEnum (minBound @a) + 1

readAs :: forall a. Read a => String -> a
readAs = read @a

main :: IO ()
main = do
  print (read @Int "42")
  print (readAs @Double "3.5")
  print (sizeOfBound @Bool)
  print (sizeOfBound @Ordering)
  print (maxBound @Int)
  print (show @Integer 7)

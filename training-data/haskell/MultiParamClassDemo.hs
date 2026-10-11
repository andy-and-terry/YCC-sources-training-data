{-# LANGUAGE MultiParamTypeClasses, FunctionalDependencies, FlexibleInstances #-}

class Convert a b | a -> b where
  convert :: a -> b

instance Convert Int String where
  convert = show

instance Convert Bool Int where
  convert True = 1
  convert False = 0

class Monoid' m a | m -> a where
  unit :: m
  combine :: m -> m -> m
  lift' :: a -> m

newtype SumI = SumI Int deriving Show

instance Monoid' SumI Int where
  unit = SumI 0
  combine (SumI a) (SumI b) = SumI (a + b)
  lift' = SumI

main :: IO ()
main = do
  putStrLn (convert (42 :: Int))
  print (convert True + 1)
  print (foldr combine unit (map lift' [1, 2, 3 :: Int]) :: SumI)

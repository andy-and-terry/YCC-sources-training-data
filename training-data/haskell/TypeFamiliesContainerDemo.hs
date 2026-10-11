{-# LANGUAGE TypeFamilies #-}

import qualified Data.Map as M

class Container f where
  type Elem f
  empty  :: f
  insert :: Elem f -> f -> f
  toL    :: f -> [Elem f]

instance Container [a] where
  type Elem [a] = a
  empty = []
  insert = (:)
  toL = id

newtype IntBag = IntBag (M.Map Int Int) deriving Show

instance Container IntBag where
  type Elem IntBag = Int
  empty = IntBag M.empty
  insert x (IntBag m) = IntBag (M.insertWith (+) x 1 m)
  toL (IntBag m) = concatMap (\(k, n) -> replicate n k) (M.toList m)

fill :: Container f => [Elem f] -> f
fill = foldr insert empty

main :: IO ()
main = do
  print (toL (fill "hello" :: String))
  print (toL (fill [3, 1, 3, 2, 1] :: IntBag))

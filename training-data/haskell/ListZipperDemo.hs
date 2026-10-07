data Zipper a = Zipper [a] a [a] deriving Show

fromList :: [a] -> Maybe (Zipper a)
fromList [] = Nothing
fromList (x : xs) = Just (Zipper [] x xs)

goLeft :: Zipper a -> Maybe (Zipper a)
goLeft (Zipper [] _ _) = Nothing
goLeft (Zipper (l : ls) f rs) = Just (Zipper ls l (f : rs))

goRight :: Zipper a -> Maybe (Zipper a)
goRight (Zipper _ _ []) = Nothing
goRight (Zipper ls f (r : rs)) = Just (Zipper (f : ls) r rs)

focus :: Zipper a -> a
focus (Zipper _ f _) = f

setFocus :: a -> Zipper a -> Zipper a
setFocus x (Zipper ls _ rs) = Zipper ls x rs

toList :: Zipper a -> [a]
toList (Zipper ls f rs) = reverse ls ++ [f] ++ rs

main :: IO ()
main = do
  let Just z = fromList [1, 2, 3, 4, 5]
  print (focus z)
  let Just z1 = goRight z
  let Just z2 = goRight z1
  print (focus z2)
  print (toList (setFocus 99 z2))
  print (goLeft z)

data Zipper a = Zipper [a] a [a] deriving Show

fromList :: [a] -> Maybe (Zipper a)
fromList [] = Nothing
fromList (x : xs) = Just (Zipper [] x xs)

left :: Zipper a -> Maybe (Zipper a)
left (Zipper [] _ _) = Nothing
left (Zipper (l : ls) f rs) = Just (Zipper ls l (f : rs))

right :: Zipper a -> Maybe (Zipper a)
right (Zipper _ _ []) = Nothing
right (Zipper ls f (r : rs)) = Just (Zipper (f : ls) r rs)

focus :: Zipper a -> a
focus (Zipper _ f _) = f

modify :: (a -> a) -> Zipper a -> Zipper a
modify g (Zipper ls f rs) = Zipper ls (g f) rs

toList :: Zipper a -> [a]
toList (Zipper ls f rs) = reverse ls ++ [f] ++ rs

main :: IO ()
main = do
  let Just z0 = fromList [1, 2, 3, 4, 5]
  let Just z1 = right z0
  let Just z2 = right z1
  print (focus z2)
  let z3 = modify (* 100) z2
  print (toList z3)
  let Just z4 = left z3
  print (focus z4)

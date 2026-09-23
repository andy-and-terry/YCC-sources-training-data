data Validated e a = Invalid [e] | Valid a deriving Show

instance Functor (Validated e) where
  fmap _ (Invalid es) = Invalid es
  fmap f (Valid a) = Valid (f a)

instance Applicative (Validated e) where
  pure = Valid
  (Invalid es1) <*> (Invalid es2) = Invalid (es1 ++ es2)
  (Invalid es) <*> _ = Invalid es
  _ <*> (Invalid es) = Invalid es
  (Valid f) <*> (Valid a) = Valid (f a)

data Person = Person String Int deriving Show

checkName :: String -> Validated String String
checkName n
  | null n = Invalid ["name is empty"]
  | otherwise = Valid n

checkAge :: Int -> Validated String Int
checkAge a
  | a < 0 = Invalid ["age is negative"]
  | a > 150 = Invalid ["age is unrealistic"]
  | otherwise = Valid a

mkPerson :: String -> Int -> Validated String Person
mkPerson n a = Person <$> checkName n <*> checkAge a

main :: IO ()
main = do
  print (mkPerson "Alice" 30)
  print (mkPerson "" (-5))
  print (mkPerson "" 200)

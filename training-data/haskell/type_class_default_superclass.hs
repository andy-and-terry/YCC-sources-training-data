class Show a => Entity a where
  ident :: a -> Int
  describe :: a -> String
  describe x = "#" ++ show (ident x) ++ " " ++ show x

data User = User Int String deriving Show
data Order = Order Int Double deriving Show
instance Entity User where ident (User i _) = i
instance Entity Order where
  ident (Order i _) = i
  describe o = "order " ++ show (ident o)

main :: IO ()
main = do
  putStrLn (describe (User 1 "ada"))
  putStrLn (describe (Order 7 9.5))
  print (minBound :: Bool, [minBound .. maxBound :: Ordering], succ 'a', fromEnum 'a', toEnum 98 :: Char)

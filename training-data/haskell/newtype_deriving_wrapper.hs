{-# LANGUAGE GeneralizedNewtypeDeriving #-}

newtype Meters = Meters Double deriving (Show, Eq, Ord, Num)
newtype Name = Name { unName :: String } deriving (Eq, Ord)
instance Show Name where show (Name n) = "<" ++ n ++ ">"

main :: IO ()
main = do
  print (Meters 3 + Meters 4.5 * 2)
  print (maximum [Name "b", Name "a"], unName (Name "x"))
  print (compare (Meters 1) (Meters 2))

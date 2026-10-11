{-# LANGUAGE GeneralizedNewtypeDeriving #-}

newtype Meters = Meters Double deriving (Show, Eq, Ord, Num, Fractional)

newtype UserId = UserId Int deriving (Show, Eq, Ord, Enum)

main :: IO ()
main = do
  let a = Meters 3.5
      b = Meters 1.5
  print (a + b, a * 2, a / b)
  print (a > b)
  print [UserId 1 .. UserId 4]
  print (succ (UserId 9))

class Describable a where
  describe :: a -> String
  describe _ = "thing"
  name' :: a -> String

data Cat = Cat
data Dog = Dog

instance Describable Cat where name' _ = "cat"
instance Describable Dog where
  name' _ = "dog"
  describe _ = "good dog"

main :: IO ()
main = putStrLn (describe Cat ++ ", " ++ describe Dog)

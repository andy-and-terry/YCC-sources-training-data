class Describable a where
  name :: a -> String

  describe :: a -> String
  describe x = "This is a " ++ name x

data Cat = Cat
data Dog = Dog

instance Describable Cat where
  name _ = "cat"

instance Describable Dog where
  name _ = "dog"
  describe _ = "This loyal dog is ready to play"

main :: IO ()
main = do
  putStrLn (describe Cat)
  putStrLn (describe Dog)
  putStrLn (name Cat)

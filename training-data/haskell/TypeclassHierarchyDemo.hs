class Named a where
  getName :: a -> String

class Named a => Greetable a where
  greeting :: a -> String
  greeting x = "Hello, " ++ getName x ++ "!"

data Person = Person String
data Robot = Robot String

instance Named Person where
  getName (Person n) = n

instance Greetable Person

instance Named Robot where
  getName (Robot n) = n

instance Greetable Robot where
  greeting r = "BEEP BOOP " ++ getName r

main :: IO ()
main = do
  putStrLn (greeting (Person "Alice"))
  putStrLn (greeting (Robot "T-800"))
  putStrLn (getName (Person "Alice"))

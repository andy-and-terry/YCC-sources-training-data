data Person = Person { name :: String, age :: Int } deriving Show

birthday :: Person -> Person
birthday p = p { age = age p + 1 }

main :: IO ()
main = do
  let p = Person { name = "Alice", age = 30 }
  print (birthday p)

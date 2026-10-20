data Person = Person { name :: String, age :: Int, email :: Maybe String } deriving (Show, Eq)

birthday :: Person -> Person
birthday p = p { age = age p + 1 }

describe :: Person -> String
describe Person { name = n, age = a } = n ++ " (" ++ show a ++ ")"

main :: IO ()
main = do
  let p = Person { name = "Ada", age = 36, email = Nothing }
  print (birthday p)
  putStrLn (describe (birthday p))
  print (p == p { email = Nothing }, email p { email = Just "a@b" })

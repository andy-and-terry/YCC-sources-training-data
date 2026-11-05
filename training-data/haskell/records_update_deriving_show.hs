data User = User { name :: String, age :: Int } deriving (Show, Eq, Ord)

main :: IO ()
main = do
  let u = User { name = "ann", age = 30 }
  print u
  print u { age = 31 }
  print (u < u { age = 31 })

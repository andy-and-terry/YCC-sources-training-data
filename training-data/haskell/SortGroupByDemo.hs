import Data.Function (on)
import Data.List (group, groupBy, nub, partition, sort, sortBy, sortOn)
import Data.Ord (Down (..), comparing)

data Person = Person {name :: String, age :: Int, city :: String} deriving Show

people :: [Person]
people =
  [ Person "Ann" 31 "Oslo"
  , Person "Bob" 25 "Rome"
  , Person "Cy" 31 "Oslo"
  , Person "Di" 22 "Rome"
  , Person "Ed" 40 "Paris"
  ]

main :: IO ()
main = do
  print (map name (sortOn age people))
  print (map name (sortOn (Down . age) people))
  print (map name (sortBy (comparing (Down . age) <> comparing name) people))

  let byCity = groupBy ((==) `on` city) (sortOn city people)
  mapM_ (\g -> putStrLn (city (head g) ++ ": " ++ show (map name g))) byCity

  print (map (\g -> (head g, length g)) (group (sort "mississippi")))
  print (map name (fst (partition ((> 30) . age) people)))
  print (nub [3, 1, 3, 2, 1 :: Int])

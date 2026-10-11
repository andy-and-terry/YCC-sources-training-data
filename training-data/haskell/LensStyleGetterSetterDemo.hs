data Address = Address { street :: String, city :: String } deriving Show
data Person = Person { name :: String, address :: Address } deriving Show

type Lens s a = (s -> a, a -> s -> s)

view :: Lens s a -> s -> a
view (g, _) = g

set :: Lens s a -> a -> s -> s
set (_, s) = s

over :: Lens s a -> (a -> a) -> s -> s
over l f x = set l (f (view l x)) x

addressL :: Lens Person Address
addressL = (address, \a p -> p { address = a })

cityL :: Lens Address String
cityL = (city, \c a -> a { city = c })

compose :: Lens a b -> Lens b c -> Lens a c
compose (g1, s1) (g2, s2) = (g2 . g1, \c a -> s1 (s2 c (g1 a)) a)

main :: IO ()
main = do
  let p = Person "Ann" (Address "1 Main St" "Paris")
      personCity = compose addressL cityL
  putStrLn (view personCity p)
  print (set personCity "Rome" p)
  print (over personCity (map succ) p)

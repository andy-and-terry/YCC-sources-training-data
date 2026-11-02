myMap :: (a -> b) -> [a] -> [b]
myMap f = foldr (\x acc -> f x : acc) []

main :: IO ()
main = print (myMap (* 2) [1 .. 5])

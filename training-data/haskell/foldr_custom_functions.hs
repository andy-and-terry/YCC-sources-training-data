myMap :: (a -> b) -> [a] -> [b]
myMap f = foldr (\x acc -> f x : acc) []

myFilter :: (a -> Bool) -> [a] -> [a]
myFilter p = foldr (\x acc -> if p x then x : acc else acc) []

main :: IO ()
main = print (myMap (* 2) [1, 2, 3], myFilter even [1 .. 10])

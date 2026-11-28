manhattan :: [Int] -> [Int] -> Int
manhattan a b = sum (zipWith (\x y -> abs (x - y)) a b)

main :: IO ()
main = print (manhattan [1, 2] [4, 6])

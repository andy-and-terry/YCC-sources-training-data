myGcd :: Int -> Int -> Int
myGcd a 0 = a
myGcd a b = myGcd b (a `mod` b)

myLcm :: Int -> Int -> Int
myLcm a b = a * b `div` myGcd a b

main :: IO ()
main = print (myGcd 48 18, myLcm 4 6)

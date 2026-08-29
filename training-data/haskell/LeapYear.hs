isLeapYear :: Int -> Bool
isLeapYear y = (y `mod` 4 == 0 && y `mod` 100 /= 0) || y `mod` 400 == 0

main :: IO ()
main = print (map isLeapYear [2000, 1900, 2024, 2023])

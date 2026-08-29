binaryToDecimal :: String -> Int
binaryToDecimal = foldl (\acc c -> acc * 2 + (if c == '1' then 1 else 0)) 0

main :: IO ()
main = print (binaryToDecimal "110101")

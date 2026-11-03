import Data.Char (digitToInt)

digitSquareSum :: Int -> Int
digitSquareSum = sum . map ((^ 2) . digitToInt) . show . abs

main :: IO ()
main = mapM_ (print . digitSquareSum) [123, -99]

import Data.Char (isUpper, toLower, toUpper)

swapCase :: String -> String
swapCase = map (\c -> if isUpper c then toLower c else toUpper c)

main :: IO ()
main = putStrLn (swapCase "Hello World 42")

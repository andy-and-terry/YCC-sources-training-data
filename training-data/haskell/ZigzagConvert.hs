import Data.List (sortOn)

zigzag :: String -> Int -> String
zigzag s rows
  | rows == 1 || rows >= length s = s
  | otherwise = map snd (sortOn fst (zip rowOf s))
  where
    cycleRows = [0 .. rows - 1] ++ [rows - 2, rows - 3 .. 1]
    rowOf = cycle cycleRows

main :: IO ()
main = putStrLn (zigzag "PAYPALISHIRING" 3)

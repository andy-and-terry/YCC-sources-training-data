import Data.List (sortOn)

encode :: Int -> String -> String
encode rails text = map snd (sortOn fst (zip keys text))
  where
    period = 2 * (rails - 1)
    rail i = let m = i `mod` period in if m < rails then m else period - m
    keys = [(rail i, i) | i <- [0 ..]]

main :: IO ()
main = putStrLn (encode 3 "WEAREDISCOVERED")

-- Cyclops numbers: odd digit count, middle digit zero, no other zeros.
-- Count those in 1..99999 (expected 6642).
isCyclops :: Int -> Bool
isCyclops n = odd len && s !! (len `div` 2) == '0' && length (filter (== '0') s) == 1
  where
    s = show n
    len = length s

main :: IO ()
main = print (length (filter isCyclops [1 .. 99999]))

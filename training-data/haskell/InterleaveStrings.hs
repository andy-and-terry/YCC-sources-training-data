import Data.List (transpose)

interleave :: [String] -> String
interleave = concat . transpose

main :: IO ()
main = do
  putStrLn (interleave ["abc", "12345"])
  putStrLn (interleave ["ab", "cd", "efg"])

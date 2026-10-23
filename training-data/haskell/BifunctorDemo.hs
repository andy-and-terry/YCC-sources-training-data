import Data.Bifunctor (bimap, first, second)

main :: IO ()
main = do
  let pair = (3 :: Int, "three")
  print (first (* 2) pair)
  print (second length pair)
  print (bimap show reverse pair)

  let ok = Right 5 :: Either String Int
      bad = Left "oops" :: Either String Int
  print (bimap length (+ 1) ok)
  print (bimap length (+ 1) bad)
  print (first (++ "!") bad)

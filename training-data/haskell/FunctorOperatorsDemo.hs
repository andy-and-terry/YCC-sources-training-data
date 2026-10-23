import Data.Functor (($>), (<&>), void)

main :: IO ()
main = do
  print (Just 3 <&> (+ 1))
  print (Just 3 $> "replaced")
  print ("x" <$ [1, 2, 3 :: Int])
  print (void (Just 'a'))
  r <- return 10 <&> (* 2)
  print (r :: Int)

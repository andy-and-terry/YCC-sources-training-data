data Config = Config { host :: String, port :: Int, debug :: Bool } deriving Show

main :: IO ()
main = do
  let c = Config { host = "h", port = 80, debug = False }
  print c { port = 8080, debug = True }

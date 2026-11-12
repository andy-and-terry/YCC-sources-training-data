data Config = Config { host :: String, port :: Int, debug :: Bool } deriving Show

defaultCfg :: Config
defaultCfg = Config { host = "localhost", port = 80, debug = False }

main :: IO ()
main = do
  let c = defaultCfg { port = 8080, debug = True }
  print c
  putStrLn (host c ++ ":" ++ show (port c))

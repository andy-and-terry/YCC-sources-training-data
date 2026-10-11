{-# LANGUAGE RecordWildCards, NamedFieldPuns #-}

data Config = Config
  { host :: String
  , port :: Int
  , debug :: Bool
  } deriving Show

describe :: Config -> String
describe Config{..} = host ++ ":" ++ show port ++ (if debug then " [debug]" else "")

portOnly :: Config -> Int
portOnly Config{port} = port

mk :: String -> Config
mk host = Config{..}
  where
    port = 8080
    debug = False

main :: IO ()
main = do
  let c = mk "localhost"
  putStrLn (describe c)
  putStrLn (describe c { debug = True })
  print (portOnly c)

import System.IO
import Control.Exception

main :: IO ()
main = do
  let path = "/tmp/haskell_io_demo.txt"
  writeFile path "alpha\nbeta\ngamma\n"
  appendFile path "delta\n"
  contents <- readFile path
  let ls = lines contents
  putStrLn ("lines: " ++ show (length ls))
  mapM_ (putStrLn . ("> " ++)) ls
  withFile path ReadMode $ \h -> do
    first <- hGetLine h
    eof <- hIsEOF h
    putStrLn (first ++ " eof=" ++ show eof)
  r <- try (readFile "/nonexistent/file") :: IO (Either IOException String)
  putStrLn (either (const "open failed") id r)

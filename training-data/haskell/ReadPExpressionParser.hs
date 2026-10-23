import Control.Applicative ((<|>))
import Data.Char (isDigit)
import Text.ParserCombinators.ReadP

-- A tiny arithmetic parser built from ReadP combinators.
token :: ReadP a -> ReadP a
token p = p <* skipSpaces

symbol :: Char -> ReadP Char
symbol = token . char

number :: ReadP Int
number = token (read <$> munch1 isDigit)

expr :: ReadP Int
expr = chainl1 term addOp

term :: ReadP Int
term = chainl1 factor mulOp

factor :: ReadP Int
factor = number <|> between (symbol '(') (symbol ')') expr

addOp :: ReadP (Int -> Int -> Int)
addOp = ((+) <$ symbol '+') <|> ((-) <$ symbol '-')

mulOp :: ReadP (Int -> Int -> Int)
mulOp = ((*) <$ symbol '*') <|> (div <$ symbol '/')

parseExpr :: String -> Maybe Int
parseExpr s = case [v | (v, "") <- readP_to_S (skipSpaces *> expr <* eof) s] of
  (v : _) -> Just v
  [] -> Nothing

-- Comma-separated integers in brackets, e.g. "[1, 2, 3]".
intList :: ReadP [Int]
intList = between (symbol '[') (symbol ']') (number `sepBy` symbol ',')

main :: IO ()
main = do
  print (parseExpr "1 + 2 * 3")
  print (parseExpr "(1 + 2) * 3")
  print (parseExpr "100 / 5 - 4")
  print (parseExpr "2 * (3 + ")
  print (fst . last $ readP_to_S intList "[1, 2, 3]")

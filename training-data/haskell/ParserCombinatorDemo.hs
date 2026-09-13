import Data.Char (isDigit)

newtype Parser a = Parser { runParser :: String -> Maybe (a, String) }

instance Functor Parser where
  fmap f (Parser p) = Parser (\s -> case p s of
    Just (a, rest) -> Just (f a, rest)
    Nothing -> Nothing)

instance Applicative Parser where
  pure a = Parser (\s -> Just (a, s))
  (Parser pf) <*> (Parser pa) = Parser (\s -> case pf s of
    Just (f, rest) -> case pa rest of
      Just (a, rest') -> Just (f a, rest')
      Nothing -> Nothing
    Nothing -> Nothing)

charP :: Char -> Parser Char
charP c = Parser (\s -> case s of
  (x : xs) | x == c -> Just (c, xs)
  _ -> Nothing)

digitP :: Parser Char
digitP = Parser (\s -> case s of
  (x : xs) | isDigit x -> Just (x, xs)
  _ -> Nothing)

many1 :: Parser a -> Parser [a]
many1 p = Parser (\s -> go s [])
  where
    go input acc = case runParser p input of
      Just (a, rest) -> go rest (acc ++ [a])
      Nothing -> if null acc then Nothing else Just (acc, input)

numberP :: Parser Int
numberP = read <$> many1 digitP

pairP :: Parser (Int, Int)
pairP = (,) <$> (numberP <* charP ',') <*> numberP

main :: IO ()
main = do
  print (runParser numberP "123abc")
  print (runParser pairP "12,34rest")
  print (runParser pairP "abc")

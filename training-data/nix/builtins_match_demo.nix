let
  # `builtins.match regex str` returns `null` when the regex (anchored
  # at both ends) doesn't match the whole string, or a list of the
  # capture groups when it does.
  extractDate = s: builtins.match "([0-9]{4})-([0-9]{2})-([0-9]{2})" s;

  parsed = extractDate "2024-06-15";
  notMatched = extractDate "not a date";

  isWord = s: builtins.match "[a-zA-Z]+" s != null;
in
  {
    inherit parsed notMatched;
    hello = isWord "hello";
    withDigits = isWord "hello123";
  }

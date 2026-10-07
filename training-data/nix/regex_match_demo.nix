{
  date = builtins.match "([0-9]{4})-([0-9]{2})-([0-9]{2})" "2024-03-15";
  noMatch = builtins.match "[a-z]+" "ABC";
  isNumber = builtins.match "[0-9]+" "12345" != null;
  split = builtins.split "[,;]" "a,b;c";
}

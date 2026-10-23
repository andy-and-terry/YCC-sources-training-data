rec {
  base = 10;
  double = base * 2;
  config = {
    size = double + 1;
    label = "size-${toString size}";
  };
}

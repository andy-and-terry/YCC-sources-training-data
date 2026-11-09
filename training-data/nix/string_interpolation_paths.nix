let
  name = "world";
  ver = 3;
in {
  greeting = "hello ${name}";
  versioned = "pkg-${toString ver}.tar.gz";
  multi = ''
    line one
    line ${name}
  '';
}

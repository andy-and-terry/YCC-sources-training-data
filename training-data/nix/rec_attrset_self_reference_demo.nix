let
  # A `rec` attrset lets its attributes refer to each other directly.
  circle = rec {
    radius = 5;
    diameter = radius * 2;
    area3 = 3 * radius * radius;     # integer approximation using pi ~ 3
    description = "radius ${toString radius}, diameter ${toString diameter}";
  };

  # The same without `rec` uses a self-reference through fix-point style
  # let-binding, which makes overriding a field easier.
  mk = self: {
    base = 10;
    doubled = self.base * 2;
    tripled = self.base * 3;
  };
  fix = f: let x = f x; in x;
  original = fix mk;
  overridden = fix (self: (mk self) // { base = 100; });
in
  { inherit circle original overridden; }

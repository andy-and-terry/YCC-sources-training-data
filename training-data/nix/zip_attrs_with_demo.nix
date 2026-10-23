let
  sets = [
    { a = 1; b = 2; }
    { a = 3; c = 4; }
    { a = 5; b = 6; }
  ];
in
  {
    collected = builtins.zipAttrsWith (name: values: values) sets;
    summed = builtins.zipAttrsWith (name: values: builtins.foldl' builtins.add 0 values) sets;
  }

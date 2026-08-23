let
  person = { name = "Alice"; age = 30; city = "NYC"; };
  updated = person // { age = 31; };
  keys = builtins.attrNames person;
  values = builtins.attrValues person;
in
  {
    inherit updated keys values;
    hasName = builtins.hasAttr "name" person;
  }

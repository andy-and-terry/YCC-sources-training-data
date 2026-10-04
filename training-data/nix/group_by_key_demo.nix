let
  people = [
    { name = "ann"; team = "red"; }
    { name = "bob"; team = "blue"; }
    { name = "cy"; team = "red"; }
    { name = "di"; team = "blue"; }
    { name = "ed"; team = "green"; }
  ];
  groupBy = key: xs:
    builtins.foldl'
      (acc: x:
        let k = x.${key};
        in acc // { ${k} = (acc.${k} or [ ]) ++ [ x.name ]; })
      { }
      xs;
in
groupBy "team" people

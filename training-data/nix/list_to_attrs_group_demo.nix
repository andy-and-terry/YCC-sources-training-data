let
  people = [
    { name = "ann"; team = "red"; }
    { name = "bob"; team = "blue"; }
    { name = "cy"; team = "red"; }
  ];
  groupBy = key: xs:
    builtins.foldl'
      (acc: x:
        let k = x.${key}; in
        acc // { ${k} = (acc.${k} or [ ]) ++ [ x.name ]; })
      { } xs;
in
  {
    byTeam = groupBy "team" people;
    nameToTeam = builtins.listToAttrs (map (p: { name = p.name; value = p.team; }) people);
    teams = builtins.catAttrs "team" people;
  }

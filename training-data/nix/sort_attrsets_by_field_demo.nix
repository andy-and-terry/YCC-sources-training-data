let
  people = [
    { name = "Carol"; age = 35; }
    { name = "Alice"; age = 30; }
    { name = "Bob"; age = 25; }
  ];

  byAge = builtins.sort (a: b: a.age < b.age) people;
  byNameDesc = builtins.sort (a: b: a.name > b.name) people;

  names = map (p: p.name) byAge;
in
  {
    inherit byAge byNameDesc names;
  }

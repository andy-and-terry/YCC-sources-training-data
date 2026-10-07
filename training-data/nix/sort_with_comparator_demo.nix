let
  people = [
    { n = "bob"; age = 30; }
    { n = "amy"; age = 25; }
    { n = "cat"; age = 35; }
  ];
in
{
  byAge = map (p: p.n) (builtins.sort (a: b: a.age < b.age) people);
  byAgeDesc = map (p: p.n) (builtins.sort (a: b: a.age > b.age) people);
  byName = map (p: p.n) (builtins.sort (a: b: a.n < b.n) people);
  numbers = builtins.sort builtins.lessThan [ 5 3 9 1 ];
}

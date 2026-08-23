let
  find = parents: x:
    let
      p = builtins.elemAt parents x;
    in
      if p == x then x else find parents p;

  union = parents: x: y:
    let
      rootX = find parents x;
      rootY = find parents y;
    in
      if rootX == rootY then parents
      else builtins.genList (i: if i == rootX then rootY else builtins.elemAt parents i) (builtins.length parents);

  initial = builtins.genList (i: i) 5;
  step1 = union initial 0 1;
  step2 = union step1 1 2;
in
  {
    connected02 = find step2 0 == find step2 2;
    connected03 = find step2 0 == find step2 3;
  }

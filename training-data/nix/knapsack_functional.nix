let
  items = [
    { weight = 2; value = 3; }
    { weight = 3; value = 4; }
    { weight = 4; value = 5; }
    { weight = 5; value = 6; }
  ];
  capacity = 5;

  knapsack = items: cap:
    if items == [ ] then 0
    else
      let
        item = builtins.head items;
        rest = builtins.tail items;
        without = knapsack rest cap;
      in
        if item.weight > cap then without
        else
          let withItem = item.value + knapsack rest (cap - item.weight);
          in if withItem > without then withItem else without;
in
  knapsack items capacity

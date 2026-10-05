# builtins.genericClosure computes a transitive closure (graph reachability)
let
  graph = {
    a = [ "b" "c" ];
    b = [ "d" ];
    c = [ "d" "e" ];
    d = [ ];
    e = [ "a" ];
  };
  reachable = start:
    map (x: x.key) (builtins.genericClosure {
      startSet = [ { key = start; } ];
      operator = item: map (k: { key = k; }) graph.${item.key};
    });
in
  {
    fromB = reachable "b";
    fromA = reachable "a";
  }

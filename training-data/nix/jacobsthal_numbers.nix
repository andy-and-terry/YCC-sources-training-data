# Jacobsthal numbers: J0=0, J1=1, Jn = J(n-1) + 2*J(n-2)
# run: nix-instantiate --eval --strict jacobsthal_numbers.nix
let
  step = acc: _: {
    a = acc.b;
    b = acc.b + 2 * acc.a;
    out = acc.out ++ [ acc.a ];
  };
  result = builtins.foldl' step { a = 0; b = 1; out = [ ]; } (builtins.genList (i: i) 15);
in
builtins.concatStringsSep " " (map toString result.out)

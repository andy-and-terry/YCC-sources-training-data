let
  # Read the binary digits of i as base-4 digits.
  moser = i: if i == 0 then 0 else (i - (i / 2) * 2) + 4 * moser (i / 2);
in
builtins.genList moser 10
# [ 0 1 4 5 16 17 20 21 64 65 ]

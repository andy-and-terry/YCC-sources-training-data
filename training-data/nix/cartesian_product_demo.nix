let
  # Nix has no native list-comprehension syntax, but nesting
  # `concatMap`/`map` reproduces one: the outer `concatMap` plays the
  # role of the first generator and the inner `map` the second, exactly
  # like `[ (x, y) | x <- xs, y <- ys ]`.
  suits = [ "hearts" "spades" ];
  ranks = [ "A" "K" "Q" ];

  cards = builtins.concatMap
    (suit: map (rank: "${rank} of ${suit}") ranks)
    suits;

  pairs = builtins.concatMap
    (x: map (y: { inherit x y; }) [ 1 2 3 ])
    [ "a" "b" ];
in
  {
    inherit cards pairs;
    count = builtins.length cards;
  }

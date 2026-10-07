let
  # `builtins.toJSON` serializes any Nix value into a JSON string;
  # `builtins.fromJSON` is its inverse, so round-tripping a value
  # through both should reproduce the original.
  data = {
    name = "widget";
    count = 3;
    tags = [ "a" "b" "c" ];
    enabled = true;
    nested = { ok = null; };
  };

  encoded = builtins.toJSON data;
  decoded = builtins.fromJSON encoded;
in
  {
    inherit encoded decoded;
    roundTrips = decoded == data;
  }

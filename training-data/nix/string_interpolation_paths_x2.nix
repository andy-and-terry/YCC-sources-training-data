let
  name = "world";
  dir = ./.;
in {
  greeting = "hello ${name}";
  conf = "${dir}/config.toml";
  upper = builtins.substring 0 1 name;
}

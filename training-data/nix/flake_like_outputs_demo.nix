let
  systems = [ "x86_64-linux" "aarch64-linux" ];
  forAllSystems = f: builtins.listToAttrs (map (s: { name = s; value = f s; }) systems);

  mkPackage = system: {
    name = "hello-" + system;
    arch = builtins.head (builtins.split "-" system);
    build = "build for ${system}";
  };

  outputs = {
    packages = forAllSystems mkPackage;
    defaultSystem = builtins.head systems;
  };
in
{
  inherit outputs;
  default = outputs.packages.${outputs.defaultSystem}.name;
}

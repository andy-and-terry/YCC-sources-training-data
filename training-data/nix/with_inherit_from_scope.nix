let
  pkgs = { hello = "h"; cowsay = "c"; };
  inherit (pkgs) hello;
in {
  inherit hello;
  all = with pkgs; [ hello cowsay ];
}

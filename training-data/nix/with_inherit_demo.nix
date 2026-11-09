let
  pkgs = { git = "git-2.40"; curl = "curl-8.0"; };
  inherit (pkgs) git;
in {
  inherit git;
  all = with pkgs; [ git curl ];
}

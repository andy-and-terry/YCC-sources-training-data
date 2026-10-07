let
  pairs = [ "x" "y" "z" ];
in
{
  fromList = builtins.listToAttrs (
    builtins.genList (i: { name = builtins.elemAt pairs i; value = i; }) (builtins.length pairs)
  );
  inverted = builtins.listToAttrs (
    map (n: { name = n; value = builtins.stringLength n; }) [ "a" "bb" "ccc" ]
  );
}

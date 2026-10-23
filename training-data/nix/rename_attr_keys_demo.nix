let
  inherit (builtins) attrNames listToAttrs map isString substring stringLength;

  # mapAttrs' equivalent: transform both names and values
  mapAttrs' = f: set:
    listToAttrs (map (n: f n set.${n}) (attrNames set));

  prefixKeys = prefix: set:
    mapAttrs' (n: v: { name = prefix + n; value = v; }) set;

  upperFirst = s:
    let
      head = substring 0 1 s;
      up = builtins.replaceStrings
        [ "a" "b" "c" "d" "e" "f" "g" "h" "i" "j" "k" "l" "m" "n" "o" "p" "q" "r" "s" "t" "u" "v" "w" "x" "y" "z" ]
        [ "A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" "L" "M" "N" "O" "P" "Q" "R" "S" "T" "U" "V" "W" "X" "Y" "Z" ]
        head;
    in
    up + substring 1 (stringLength s) s;

  env = { home = "/root"; shell = "bash"; editor = "vi"; };
in
{
  prefixed = prefixKeys "APP_" env;
  capitalised = mapAttrs' (n: v: { name = upperFirst n; value = v; }) env;
  swapped = mapAttrs' (n: v: { name = v; value = n; }) env;
  onlyStringValues = builtins.all isString (builtins.attrValues env);
}

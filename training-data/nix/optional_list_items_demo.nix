let
  optional = cond: x: if cond then [ x ] else [ ];
  optionals = cond: xs: if cond then xs else [ ];
  withGui = false;
  withNet = true;
in
[ "core" ] ++ optional withGui "gtk" ++ optionals withNet [ "curl" "openssl" ]

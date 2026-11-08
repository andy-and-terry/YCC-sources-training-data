let
  varint = n:
    if n < 128 then [ n ]
    else [ (builtins.bitOr (n - (n / 128) * 128) 128) ] ++ varint (n / 128);
in
varint 300

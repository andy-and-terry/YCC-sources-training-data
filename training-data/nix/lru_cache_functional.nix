let
  capacity = 2;

  touch = key: cache: [ key ] ++ builtins.filter (k: k != key) cache;

  put = key: value: state:
    let
      values = state.values // { ${toString key} = value; };
      newOrder = touch key state.order;
      overflow = builtins.length newOrder > capacity;
      evictedKey = if overflow then builtins.elemAt newOrder (builtins.length newOrder - 1) else null;
      trimmed = if overflow then builtins.filter (k: k != evictedKey) newOrder else newOrder;
      finalValues = if evictedKey == null then values else builtins.removeAttrs values [ (toString evictedKey) ];
    in
      { order = trimmed; values = finalValues; };

  get = key: state:
    if builtins.elem key state.order then
      { found = true; value = state.values.${toString key}; state = state // { order = touch key state.order; }; }
    else
      { found = false; value = null; state = state; };

  s0 = { order = [ ]; values = { }; };
  s1 = put 1 "a" s0;
  s2 = put 2 "b" s1;
  r1 = get 1 s2;
  s3 = put 3 "c" r1.state; # evicts key 2, the least recently used
  r2 = get 2 s3;
  r3 = get 1 s3;
in
{
  afterGet1 = r1.value;
  key2Present = r2.found;
  key1Present = r3.found;
}

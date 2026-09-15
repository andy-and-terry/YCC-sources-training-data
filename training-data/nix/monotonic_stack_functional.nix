let
  # for each index, find the next element to the right that is strictly
  # greater; result is -1 when no such element exists
  nextGreaterElements = nums:
    let
      n = builtins.length nums;
      indices = builtins.genList (i: i) n;

      go = i: stack: results:
        if i >= n then
          builtins.foldl' (acc: idx: acc // { ${toString idx} = -1; }) results stack
        else
          let
            popped = builtins.foldl'
              (acc: top:
                if acc.continue && builtins.elemAt nums top < builtins.elemAt nums i then
                  { continue = true; stack = acc.stack; results = acc.results // { ${toString top} = builtins.elemAt nums i; }; }
                else
                  { continue = false; stack = acc.stack ++ [ top ]; results = acc.results; })
              { continue = true; stack = [ ]; results = results; }
              stack;
          in
            go (i + 1) (popped.stack ++ [ i ]) popped.results;

      finalMap = go 0 [ ] { };
    in
      map (i: finalMap.${toString i}) indices;

  nums = [ 2 1 2 4 3 ];
in
{
  input = nums;
  nextGreater = nextGreaterElements nums;
}

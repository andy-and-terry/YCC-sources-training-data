let
  # for each index, find the next element to the right that is strictly
  # greater; result is -1 when no such element exists
  nextGreaterElements = nums:
    let
      n = builtins.length nums;

      # stack is a list of indices with the head as the top of the stack;
      # pops indices whose value is smaller than nums[i], recording each
      # popped index's answer along the way
      popWhileSmaller = i: stack: results:
        if stack == [ ] then
          { stack = stack; results = results; }
        else
          let top = builtins.head stack; in
          if builtins.elemAt nums top < builtins.elemAt nums i then
            popWhileSmaller i (builtins.tail stack) (results // { ${toString top} = builtins.elemAt nums i; })
          else
            { stack = stack; results = results; };

      go = i: stack: results:
        if i >= n then
          builtins.foldl' (acc: idx: acc // { ${toString idx} = -1; }) results stack
        else
          let popped = popWhileSmaller i stack results; in
          go (i + 1) ([ i ] ++ popped.stack) popped.results;

      finalMap = go 0 [ ] { };
    in
      builtins.genList (i: finalMap.${toString i}) n;

  nums = [ 2 1 2 4 3 ];
in
{
  input = nums;
  nextGreater = nextGreaterElements nums;
}

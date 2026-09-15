let
  # returns true if some subset of `nums` sums exactly to `target`
  subsetSum = nums: target:
    let
      go = index: remaining:
        if remaining == 0 then true
        else if index >= builtins.length nums then false
        else if remaining < 0 then false
        else
          let n = builtins.elemAt nums index; in
          (go (index + 1) (remaining - n)) || (go (index + 1) remaining);
    in
      go 0 target;

  nums = [ 3 34 4 12 5 2 ];
in
{
  canMake9 = subsetSum nums 9;
  canMake10 = subsetSum nums 10;
  canMake30 = subsetSum nums 30;
  canMake1 = subsetSum nums 1;
}

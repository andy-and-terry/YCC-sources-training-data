let
  quickselect = list: k:
    let
      pivot = builtins.head list;
      rest = builtins.tail list;
      smaller = builtins.filter (x: x < pivot) rest;
      equal = builtins.filter (x: x == pivot) rest ++ [ pivot ];
      larger = builtins.filter (x: x > pivot) rest;
      smallerLen = builtins.length smaller;
      equalLen = builtins.length equal;
    in
      if k < smallerLen then quickselect smaller k
      else if k < smallerLen + equalLen then pivot
      else quickselect larger (k - smallerLen - equalLen);

  data = [ 7 2 9 4 1 8 3 ];
in
{
  secondSmallest = quickselect data 1;
  median = quickselect data 3;
  largest = quickselect data 6;
}

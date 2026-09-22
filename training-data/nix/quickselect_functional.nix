let
  partition = pivot: list:
    {
      lower = builtins.filter (x: x < pivot) list;
      equal = builtins.filter (x: x == pivot) list;
      higher = builtins.filter (x: x > pivot) list;
    };

  quickSelect = list: k:
    if list == [ ] then throw "empty list"
    else
      let
        pivot = builtins.elemAt list 0;
        parts = partition pivot list;
        lowerLen = builtins.length parts.lower;
        equalLen = builtins.length parts.equal;
      in
        if k < lowerLen then quickSelect parts.lower k
        else if k < lowerLen + equalLen then pivot
        else quickSelect parts.higher (k - lowerLen - equalLen);

  kthSmallest = list: k: quickSelect list (k - 1);

  data = [ 7 2 9 4 1 8 3 6 ];
in
{
  third = kthSmallest data 3;
  smallest = kthSmallest data 1;
  largest = kthSmallest data (builtins.length data);
}

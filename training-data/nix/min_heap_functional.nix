let
  swap = list: i: j:
    builtins.genList
      (k:
        if k == i then builtins.elemAt list j
        else if k == j then builtins.elemAt list i
        else builtins.elemAt list k)
      (builtins.length list);

  siftUp = heap: i:
    if i == 0 then heap
    else
      let parent = (i - 1) / 2; in
      if builtins.elemAt heap i < builtins.elemAt heap parent then
        siftUp (swap heap i parent) parent
      else heap;

  insert = heap: value:
    let heap' = heap ++ [ value ]; in
    siftUp heap' (builtins.length heap' - 1);

  siftDown = heap: i:
    let
      n = builtins.length heap;
      left = 2 * i + 1;
      right = 2 * i + 2;
      smallest =
        let s1 = if left < n && builtins.elemAt heap left < builtins.elemAt heap i then left else i; in
        if right < n && builtins.elemAt heap right < builtins.elemAt heap s1 then right else s1;
    in
      if smallest == i then heap else siftDown (swap heap i smallest) smallest;

  extractMin = heap:
    let
      n = builtins.length heap;
      minVal = builtins.elemAt heap 0;
      lastVal = builtins.elemAt heap (n - 1);
    in
      if n == 1 then { min = minVal; rest = [ ]; }
      else
        let newHeap = builtins.genList (i: if i == 0 then lastVal else builtins.elemAt heap i) (n - 1);
        in { min = minVal; rest = siftDown newHeap 0; };

  heap0 = builtins.foldl' insert [ ] [ 5 3 8 1 9 2 ];
  first = extractMin heap0;
  second = extractMin first.rest;
in
  {
    firstMin = first.min;
    secondMin = second.min;
  }

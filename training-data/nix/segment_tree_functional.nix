let
  arr = [ 1 3 5 7 9 11 ];
  n = builtins.length arr;

  build = lo: hi:
    if lo == hi then
      { left = lo; right = hi; sum = builtins.elemAt arr lo; children = null; }
    else
      let
        mid = (lo + hi) / 2;
        l = build lo mid;
        r = build (mid + 1) hi;
      in
        { left = lo; right = hi; sum = l.sum + r.sum; children = { inherit l r; }; };

  query = tree: qlo: qhi:
    if tree.right < qlo || tree.left > qhi then 0
    else if qlo <= tree.left && tree.right <= qhi then tree.sum
    else query tree.children.l qlo qhi + query tree.children.r qlo qhi;

  tree = build 0 (n - 1);
in
{
  total = query tree 0 (n - 1);
  rangeQuery1to3 = query tree 1 3;
}

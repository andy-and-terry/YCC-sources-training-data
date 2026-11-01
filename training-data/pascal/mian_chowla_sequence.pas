program MianChowlaSequence;
{ Greedy sequence whose pairwise sums are all distinct. }

var
  seq: array[1..8] of Integer;
  used, fresh: array[0..255] of Boolean;
  n, cand, i, s: Integer;
  ok: Boolean;
begin
  FillChar(used, SizeOf(used), 0);
  n := 0;
  cand := 1;
  while n < 8 do
  begin
    FillChar(fresh, SizeOf(fresh), 0);
    ok := True;
    seq[n + 1] := cand;
    for i := 1 to n + 1 do
    begin
      s := seq[i] + cand;
      if used[s] or fresh[s] then ok := False
      else fresh[s] := True;
    end;
    if ok then
    begin
      for s := 0 to 255 do
        if fresh[s] then used[s] := True;
      Inc(n);
    end;
    Inc(cand);
  end;
  for i := 1 to 8 do Write(seq[i], ' ');
  WriteLn;
end.

program LongestIncreasingSubsequenceDemo;

const
  N = 8;

var
  data: array[0..N - 1] of Integer = (10, 9, 2, 5, 3, 7, 101, 18);
  lengths: array[0..N - 1] of Integer;
  i, j, best: Integer;

begin
  for i := 0 to N - 1 do
    lengths[i] := 1;

  for i := 1 to N - 1 do
    for j := 0 to i - 1 do
      if (data[j] < data[i]) and (lengths[j] + 1 > lengths[i]) then
        lengths[i] := lengths[j] + 1;

  best := 0;
  for i := 0 to N - 1 do
    if lengths[i] > best then best := lengths[i];

  WriteLn('longest increasing subsequence length: ', best);
end.

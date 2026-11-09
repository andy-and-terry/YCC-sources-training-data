program CaseRangeDemo;
var n: Integer;
begin
  for n in [5, 15, 55, 150] do
    case n of
      0..9:    WriteLn(n, ' single');
      10..99:  WriteLn(n, ' double');
    else       WriteLn(n, ' large');
    end;
end.

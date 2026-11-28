program HammingWeight;

function PopCount(n: QWord): Integer;
begin
  Result := 0;
  while n <> 0 do
  begin
    n := n and (n - 1);
    Inc(Result);
  end;
end;

begin
  WriteLn(PopCount($B7), ' ', PopCnt(QWord($B7)));
end.

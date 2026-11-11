program ExcelColumnTitle;

function ColumnTitle(n: Integer): string;
begin
  Result := '';
  while n > 0 do
  begin
    Dec(n);
    Result := Chr(Ord('A') + n mod 26) + Result;
    n := n div 26;
  end;
end;

begin
  WriteLn(ColumnTitle(28), ' ', ColumnTitle(701)); { AB ZY }
end.

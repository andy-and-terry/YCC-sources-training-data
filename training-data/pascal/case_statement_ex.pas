program CaseStatementEx;
var N: Integer;
begin
  for N := 1 to 12 do
    case N of
      1, 3, 5, 7, 8, 10, 12: WriteLn(N, ' has 31 days');
      4, 6, 9, 11: WriteLn(N, ' has 30 days');
    else
      WriteLn(N, ' is February');
    end;
end.

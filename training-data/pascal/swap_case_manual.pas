program SwapCaseManual;

function SwapCase(const S: string): string;
var
  I: Integer;
begin
  Result := S;
  for I := 1 to Length(Result) do
    if Result[I] in ['A'..'Z'] then Result[I] := Chr(Ord(Result[I]) + 32)
    else if Result[I] in ['a'..'z'] then Result[I] := Chr(Ord(Result[I]) - 32);
end;

begin
  WriteLn(SwapCase('Hello World 42'));
end.

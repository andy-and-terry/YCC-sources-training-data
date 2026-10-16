program UppercaseWordsDemo;

uses SysUtils;

function TitleCase(const s: string): string;
var
  i: Integer;
  startOfWord: Boolean;
begin
  Result := LowerCase(s);
  startOfWord := True;
  for i := 1 to Length(Result) do
  begin
    if startOfWord and (Result[i] in ['a'..'z']) then
      Result[i] := UpCase(Result[i]);
    startOfWord := Result[i] = ' ';
  end;
end;

begin
  WriteLn(TitleCase('the QUICK brown fOX'));
  WriteLn(TitleCase('free pascal compiler'));
end.

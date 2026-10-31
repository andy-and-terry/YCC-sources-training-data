program SelfDescribingNumbers;

function IsSelfDescribing(const s: string): Boolean;
var
  i, j, count: Integer;
begin
  IsSelfDescribing := False;
  for i := 0 to Length(s) - 1 do
  begin
    count := 0;
    for j := 1 to Length(s) do
      if s[j] = Chr(Ord('0') + i) then Inc(count);
    if count <> Ord(s[i + 1]) - Ord('0') then Exit;
  end;
  IsSelfDescribing := True;
end;

begin
  WriteLn('1210 ', IsSelfDescribing('1210'));
  WriteLn('2020 ', IsSelfDescribing('2020'));
  WriteLn('21200 ', IsSelfDescribing('21200'));
  WriteLn('1211 ', IsSelfDescribing('1211'));
end.

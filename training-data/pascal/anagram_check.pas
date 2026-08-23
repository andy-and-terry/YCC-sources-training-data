program AnagramCheckDemo;

function Normalize(s: string): string;
var
  i, j: Integer;
  temp: Char;
  result: string;
begin
  result := '';
  for i := 1 to Length(s) do
    if s[i] <> ' ' then result := result + LowerCase(s[i]);
  for i := 1 to Length(result) - 1 do
    for j := i + 1 to Length(result) do
      if result[i] > result[j] then
      begin
        temp := result[i];
        result[i] := result[j];
        result[j] := temp;
      end;
  Normalize := result;
end;

function IsAnagram(a, b: string): Boolean;
begin
  IsAnagram := Normalize(a) = Normalize(b);
end;

begin
  WriteLn(IsAnagram('listen', 'silent'));
  WriteLn(IsAnagram('hello', 'world'));
end.

program RunLengthEncodingDemo;

function NumToStr(n: Integer): String;
var
  s: String;
begin
  s := '';
  if n = 0 then
    s := '0'
  else
    while n > 0 do
    begin
      s := Chr(Ord('0') + (n mod 10)) + s;
      n := n div 10;
    end;
  NumToStr := s;
end;

function Encode(s: String): String;
var
  i, count: Integer;
  encoded: String;
begin
  encoded := '';
  i := 1;
  while i <= Length(s) do
  begin
    count := 1;
    while (i + count <= Length(s)) and (s[i + count] = s[i]) do
      count := count + 1;
    encoded := encoded + s[i] + NumToStr(count);
    i := i + count;
  end;
  Encode := encoded;
end;

function Decode(s: String): String;
var
  i, count: Integer;
  decoded: String;
  ch: Char;
begin
  decoded := '';
  i := 1;
  while i <= Length(s) do
  begin
    ch := s[i];
    i := i + 1;
    count := 0;
    while (i <= Length(s)) and (s[i] >= '0') and (s[i] <= '9') do
    begin
      count := count * 10 + (Ord(s[i]) - Ord('0'));
      i := i + 1;
    end;
    while count > 0 do
    begin
      decoded := decoded + ch;
      count := count - 1;
    end;
  end;
  Decode := decoded;
end;

begin
  WriteLn(Encode('aaabbbcccd'));
  WriteLn(Decode(Encode('aaabbbcccd')));
  WriteLn(Encode('wwwwaaadexxxxxx'));
end.

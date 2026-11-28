program AddBinaryStrings;

function AddBinary(const a, b: string): string;
var
  i, j, carry, sum: Integer;
begin
  Result := '';
  i := Length(a); j := Length(b); carry := 0;
  while (i > 0) or (j > 0) or (carry > 0) do
  begin
    sum := carry;
    if i > 0 then begin sum := sum + Ord(a[i]) - Ord('0'); Dec(i); end;
    if j > 0 then begin sum := sum + Ord(b[j]) - Ord('0'); Dec(j); end;
    Result := Chr(Ord('0') + sum mod 2) + Result;
    carry := sum div 2;
  end;
end;

begin
  WriteLn(AddBinary('1010', '1011')); { 10101 }
end.
